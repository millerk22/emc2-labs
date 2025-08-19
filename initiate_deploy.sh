#!/usr/bin/env bash

# Deployment script to deploy fall, winter, or all
# Usage: initiate_deploy.sh [f|w|a]
# Options:
#   a       - fall and winter
#   f       - fall
#   w       - winter

set -euo pipefail

source ./config/server_config.env

EMC2_HOST="ym-emc2.byu.edu"

### ESCAPE SEQUENCES FOR TEXT COLOR
RESET=$'\e[39m'
GREY=$'\e[38;5;242m'
PURPLE=$'\e[38;5;92m'
RED=$'\e[31m'
GREEN=$'\e[32m'
###

### FUNCTIONS
usage() {
    printf "${RED}Usage: initiate_deploy.sh [f|w|a]${RESET}\n"
    exit 1
}

initiateDeploySSH() {
    local type="$1"

    if [[ "$type" != "-w" && "$type" != "-f" && "$type" != "-a" ]]; then
        printf "${RED}initiateDeploySSH used with type = $type which is not 'fall', 'winter', or 'all'.${RESET}\n"
        exit 1
    fi

    # attempt keyless login, if it fails, it will generate a key
    if ! ssh -o PasswordAuthentication=no "$EMC2_USER@$EMC2_HOST" true 2>/dev/null; then
        printf "${PURPLE}No SSH Key found for $EMC2_USER on $EMC2_HOST.${RESET}\n"
        printf "${PURPLE}Follow this process to create a key.${RESET}\n"

        read -p "${PURPLE}Username for EMC2 server: ${RESET}" EMC2_USER
        read -p "${PURPLE}Your email (for identification): ${RESET}" USER_EMAIL

        printf "${PURPLE}Creating a key...${RESET}\n"
        if [ ! -f ~/.ssh/id_emc2 ]; then
            # create key with ed25519 named id_emc2 with empty passphrase
            ssh-keygen -t ed25519 -f ~/.ssh/id_emc2 -N "" -C $USER_EMAIL
        fi
        # generate a key with id_emc2 id and add it to config so it will be automatically recognized
        if ! grep -q "Host $EMC2_HOST" ~/.ssh/config 2>/dev/null; then
            {
                printf "\n"
                printf "Host $EMC2_HOST\n"
                printf "  HostName $EMC2_HOST\n"
                printf "  User $EMC2_USER\n"
                printf "  IdentityFile ~/.ssh/id_emc2\n"
            } >> ~/.ssh/config
        fi
        
        printf "${PURPLE}Copying the key to $EMC2_HOST${RESET}\n"
        ssh-copy-id -i ~/.ssh/id_emc2.pub $EMC2_USER@$EMC2_HOST
    fi

    printf "${PURPLE}SSH-ing into host${RESET}\n"
    if ! ssh -t "$EMC2_USER@$EMC2_HOST" "cd \"$EMC2_PATH\" && bash config/build_and_deploy.sh \"$type\" -p \"$MATH_PATH\""; then
        printf "${RED}Failed to ssh into emc2 server and run build_and_deploy.sh${RESET}\n"
        exit 1
    fi
}
###


FALL=0
WINTER=0
ALL=0
while getopts ":fwa" opt; do
    case $opt in
        f)
            FALL=1;;
        w)
            WINTER=1;;
        a)
            ALL=1;;
        \?)
            printf "${RED}Invalid option: -$OPTARG${RESET}\n"
            usage
            ;;
    esac
done

if (( $FALL + $WINTER + ALL != 1 )); then
    printf "${RED}Error: Only one argument allowed.${RESET}\n"
    usage
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$FALL" -eq 1 ]]; then
    initiateDeploySSH "-f"
elif [[ "$WINTER" -eq 1 ]]; then
    initiateDeploySSH "-w"
else
    initiateDeploySSH "-a"
fi

#!/usr/bin/env bash

# Deployments script to deploy fall, winter, or all
# Usage: initiate_deploy.sh [f|w|a]
# Options:
#   a       - fall and winter
#   f       - fall
#   w       - winter

#!/usr/bin/env bash

set -euo pipefail

source ./server_config.env

### ESCAPE SEQUENCES FOR TEXT COLOR
RESET=$'\e[39m'
GREY=$'\e[38;5;242m'
PURPLE=$'\e[38;5;92m'
RED=$'\e[31m'
GREEN=$'\e[32m'
###

EMC2_HOST="ym-emc2.byu.edu"

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
            echo -e "${RED}Invalid option: -$OPTARG${RESET}"
            usage
            ;;
    esac
done

if (( $FALL + $WINTER + ALL != 1 )); then
    echo -e "${RED}Error: Only one argument allowed.${RESET}\n"
    usage
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
    echo -e "${RED}Usage: initiate_deploy.sh [f|w|a]${RESET}"
    exit 1
}

initiateDeploySSH() {
    local type="$1"

    if [[ "$type" != "-w" && "$type" != "-f" && "$type" != "-a" ]]; then
        echo -e "${RED}initiateDeploySSH used with type = $type which is not 'fall', 'winter', or 'all'.${RESET}"
        exit 1
    fi

    # attempt keyless login, if it fails, it will generate a key
    if ! ssh -o PasswordAuthentication=no "$EMC2_USER@$EMC2_HOST" true 2>/dev/null; then
        read -p "User for EMC2: " EMC2_USER
        read -p "Host name for EMC2: " EMC2_HOST
        read -p "Your email: " USER_EMAIL
        echo

        echo -e "${PURPLE}Creating a key...${RESET}"
        if [ ! -f ~/.ssh/id_emc2 ]; then
            # create key with ed25519 named id_emc2 with empty passphrase
            ssh-keygen -t ed25519 -f ~/.ssh/id_emc2 -N "" -C $USER_EMAIL
        fi
        # generate a key with id_emc2 id and add it to config so it will be automatically recognized
        if ! grep -q "Host $EMC2_HOST" ~/.ssh/config 2>/dev/null; then
            {
                echo ""
                echo "Host $EMC2_HOST"
                echo "  HostName $EMC2_HOST"
                echo "  User $EMC2_USER"
                echo "  IdentityFile ~/.ssh/id_emc2"
            } >> ~/.ssh/config
        fi
        
        echo -e "${PURPLE}Copying the key...${RESET}"
        ssh-copy-id -i ~/.ssh/id_emc2.pub $EMC2_USER@$EMC2_HOST
    fi

    echo -e "${PURPLE}SSH-ing into host${RESET}"
    if ! ssh -t "$EMC2_USER@$EMC2_HOST" "cd \"$EMC2_PATH\" && bash build_and_deploy.sh \"$type\" -p \"$MATH_PATH\""; then
        echo -e "${RED}Failed to ssh into emc2 server and run build_and_deploy.sh${RESET}"
        exit 1
    fi
}

if [[ "$FALL" -eq 1 ]]; then
    initiateDeploySSH "-f"
elif [[ "$WINTER" -eq 1 ]]; then
    initiateDeploySSH "-w"
else
    initiateDeploySSH "-a"
fi

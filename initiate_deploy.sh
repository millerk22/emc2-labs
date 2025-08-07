#!/usr/bin/env bash

# Deployments script to deploy fall, winter, or all
# Usage: deploy.sh [f|w]
# Options:
#   None    - fall and winter
#   f       - fall
#   w       - winter

#!/usr/bin/env bash

set -euo pipefail

source ./server_config_emc2.env
source ./server_config_math.env


FALL=0
WINTER=0
while getopts ":fw" opt; do
    case $opt in
        f)
            FALL=1;;
        w)
            WINTER=1;;
        \?)
            echo "Invalid option: -$OPTARG"
            echo "Usage: deploy.sh [f|w]"
            exit 1
            ;;
    esac
done

if (( $FALL + $WINTER > 1 )); then
    echo "Error: Cannot use both -f (fall) and -w (winter), run with no arguments to deploy both."
    echo "Usage: deploy.sh [f|w]"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

initiateDeploySSH() {
    local type="$1"

    if [[ "$type" != "-w" && "$type" != "-f" && "$type" != "-a" ]]; then
        echo "deploySSH used with type = $type which is not 'fall', 'winter', or 'all'"
        exit 1
    fi

    # attempt keyless login, if it fails, it will generate a key
    echo "going into if"
    if ! ssh -o PasswordAuthentication=no "$EMC2_USER@$EMC2_HOST" true 2>/dev/null; then
        read -p "User for EMC2: " EMC2_USER
        read -p "Host name for EMC2: " EMC2_HOST
        read -p "Your email: " USER_EMAIL
        echo

        echo "Creating a key"
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
        
        echo "Copying the key"
        ssh-copy-id -i ~/.ssh/id_emc2.pub $EMC2_USER@$EMC2_HOST
    fi

    echo "SSH-ing into host"
    ssh -t "$EMC2_USER@$EMC2_HOST" TYPE=$type MATH_PATH=$MATH_PATH bash <<EOF
        cd "$EMC2_PATH" || exit 1
        bash build_and_deploy.sh \$TYPE -p $MATH_PATH
EOF
    # the \ means it will be expanded remotely (on the emc2 server while the normal variables will be expanded locally)




    # output=$(sshpass -p "$EMC2_SSH_PASSWORD" ssh -o StrictHostKeyChecking=no "$EMC2_USER@$EMC2_HOST" "cd $EMC2_PATH && echo "Calling script"")
    # # output=$(sshpass -p "$EMC2_SSH_PASSWORD" ssh -o StrictHostKeyChecking=no "$EMC2_USER@$EMC2_HOST" "cd $EMC2_PATH && ./build_and_deploy.sh $type")
    # status=$?
    # # verify ssh worked
    # if [ $status -eq 0 ]; then
    #     echo "Success:"
    #     echo "$output"
    # else
    #     echo "Failed with exit code $status"
    #     echo "$output"
    # fi
}

if [[ "$FALL" -eq 1 ]]; then
    echo "AJLFDS"
    initiateDeploySSH "-f"
elif [[ "$WINTER" -eq 1 ]]; then
    initiateDeploySSH "-w"
else
    initiateDeploySSH "-a"
fi

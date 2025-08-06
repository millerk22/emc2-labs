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

EMC2_PATH=emc2-labs
MATH_PATH=public_www/emc2

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

    if [[ "$type" != "-w" && "$type" != "-f" ]]; then
        echo "deploySSH used with type = $type which is not 'fall' or 'winter'"
        exit 1
    fi

    # clear everything in the directory
    if [[ ! -n "$EMC2_SSH_PASSWORD" && ! -n "$EMC2_USER" && ! -n "$EMC2_HOST" ]]; then
        read -s EMC2_USER
        echo
        read -s EMC2_HOST
        echo
        read -s -p EMC2_SSH_PASSWORD
        echo
    fi
    output=$(sshpass -p "$EMC2_SSH_PASSWORD" ssh -o StrictHostKeyChecking=no "$EMC2_USER@$EMC2_HOST" "cd $EMC2_PATH && ./build_and_deploy.sh $type")
    status=$?
    # verify ssh worked
    if [ $status -eq 0 ]; then
        echo "Success:"
        echo "$output"
    else
        echo "Failed with exit code $status"
        echo "$output"
    fi
}

if [[ "$FALL" -eq 1 ]]; then
    initiateDeploySSH "-f"
elif [[ "$WINTER" -eq 1 ]]; then
    initiateDeploySSH "-w"
else
    initiateDeploySSH "-a"
fi

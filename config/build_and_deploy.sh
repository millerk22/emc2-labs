#!/usr/bin/env bash

set -euo pipefail

### ESCAPE SEQUENCES FOR TEXT COLOR
RESET=$'\e[39m'
GREY=$'\e[38;5;242m'
PURPLE=$'\e[38;5;92m'
RED=$'\e[31m'
GREEN=$'\e[32m'
###

### FUNCTIONS
usage() {
    printf "${RED}Usage: build_and_deploy.sh [f|w|a] -p path${RESET}\n"
    exit 1
}

getServerCredentials() {
    read -p "${PURPLE}Username for math department server: ${RESET}" MATH_USER
    read -s -p "${PURPLE}Password for math department server: ${RESET}" MATH_PASSWORD
    printf "\n"
}

buildType() {
    local Type="$1" # expects uppercase first letter ("Fall" or "Winter")
    local type=$(echo "$Type" | tr '[:upper:]' '[:lower:]') # converts to all lowercase ("fall" or "winter")
    local commit="$2"

    # Make html
    printf "${PURPLE}Making html...${RESET}\n"
    make -C "EMC2-Labs-$Type" clean
    make SPHINXOPTS="-W" -C "EMC2-Labs-$Type" html  # compile in -C directory and -W will treat warnings as errors
    status=$?
    if [ $status -ne 0 ]; then
        printf "${RED}Make failed with code $status.${RESET}\n"
        printf "${GREEN}Hint: You may need to fix the errors in red.${RESET}\n"
        exit 1
    fi

    printf "${PURPLE}Checking SSH from emc2 server to math server${RESET}\n"
    if ! ssh -t "$MATH_USER@$MATH_PATH" "exit 0"; then
        printf "${RED}Failed to ssh into math server\n${RESET}"
        exit 1
    fi

    sshpass -p "$MATH_PASSWORD" scp -r -o StrictHostKeyChecking=no EMC2-Labs-$Type/_build/html/* "$MATH_USER@mathdept.byu.edu:$MATH_PATH/${type}-labs/"
    status=$?
    if [ $status -ne 0 ]; then
        printf "${RED}scp failed with code $status.${RESET}\n"
        exit 1
    fi

    printf "${GREEN}Successfully built and deployed $Type labs.${RESET}\n"

    dateStr=$(TZ="MST7MDT" date +"%Y-%m-%d %H:%M") # Mountain time
    echo "$dateStr: Deployed $Type for commit $commit." >> config/deployment_history.txt
}
###

FALL=0
WINTER=0
ALL=0
while getopts ":fwap:" opt; do
    case $opt in
        f)
            FALL=1;;
        w)
            WINTER=1;;
        a)
            ALL=1;;
        p)
            MATH_PATH="$OPTARG";;
        :)
            printf "${RED}Error: Option -$OPTARG requires an argument.${RESET}\n" >&2
            usage;;
        \?)
            printf "${RED}Invalid option: -$OPTARG${RESET}\n"
            usage;;
    esac
done

if (( $FALL + $WINTER + $ALL != 1 )); then
    printf "${RED}Only one argument allowed.${RESET}\n"
    usage
fi

# verify we are on the math server
host=$( hostname )
if [[ "$host" != "ym-emc2" ]]; then
    printf "${RED}build_and_deploy.sh is not being run from the math department's server, but from ${host}. Check the README for details.${RESET}\n"
    exit 1
fi

# Verify conda exists
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
else
    printf "${RED}conda.sh not found.${RESET}\n"
    exit 1
fi

printf "${PURPLE}Checking out main branch...${RESET}\n"
git checkout main
git pull origin main
printf "${PURPLE}Pulling from GitHub...${RESET}\n"
gitCommit=$(git rev-parse --short HEAD)

# Activate Conda
printf "${PURPLE}Activating environment...${RESET}\n"
conda activate emc2dev
status=$?
if [ $status -ne 0 ]; then
    printf "${RED}Conda activate failed with code $status.${RESET}\n"
    exit 1
fi

getServerCredentials

if (( $FALL == 1 )); then
    buildType "Fall" $gitCommit
elif (( $WINTER == 1 )); then
    buildType "Winter" $gitCommit
else
    buildType "Fall" $gitCommit
    buildType "Winter" $gitCommit
    printf "${GREEN}Successfully deployed both Fall and Winter labs.${RESET}\n"
fi

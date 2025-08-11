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
    echo -e "${RED}Usage: build_and_deploy.sh [f|w|a] -p path${RESET}"
    exit 1
}

buildType() {
    local Type="$1" # expects uppercase first letter ("Fall" or "Winter")
    local type=$(echo "$Type" | tr '[:upper:]' '[:lower:]') # converts to all lowercase ("fall" or "winter")

    echo -e "${PURPLE}Activating environment...${RESET}"
    conda activate emc2_dev

    echo -e "${PURPLE}Making html...${RESET}"
    make -C "../EMC2-Labs-$Type" clean
    make SPHINXOPTS="-W" -C "EMC2-Labs-$Type" html  # compile in -C directory and -W will treat warnings as errors

    status=$?
    if [ $status -ne 0 ]; then
        echo -e "${RED}Make failed with code $status.${RESET}"
        echo -e "${GREEN}Hint: You may need to fix the errors in red.${RESET}"
        exit 1
    fi

    read -p "Username for math department server: " MATH_USER
    read -s -p "Password for math department server: " MATH_PASSWORD
    echo

    sshpass -p "$MATH_PASSWORD" scp -r -o StrictHostKeyChecking=no ../EMC2-Labs-$Type/_build/html/* "$MATH_USER@mathdept.byu.edu:$MATH_PATH/${type}-labs/"
    status=$?
    if [ $status -ne 0 ]; then
        echo -e "${RED}scp failed with code $status.${RESET}"
        exit 1
    fi

    echo -e "${GREEN}Successfully built and deployed $Type labs.${RESET}"
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
            echo -e "${RED}Error: Option -$OPTARG requires an argument.${RESET}" >&2
            usage;;
        \?)
            echo -e "${RED}Invalid option: -$OPTARG${RESET}"
            usage;;
    esac
done

if (( $FALL + $WINTER + $ALL != 1 )); then
    echo -e "${RED}Only one argument allowed.${RESET}"
    usage
fi

# verify we are on the math server
host=$( hostname )
if [[ "$host" != "math" ]]; then
    echo -e "${RED}build_and_deploy.sh is not being run from the math department's server, but from ${host}. Check the README for details.${RESET}"
    exit 1
fi

# Verify conda exists
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
else
    echo -e "${RED}conda.sh not found.${RESET}"
    exit 1
fi

echo -e "${PURPLE}Checking out main branch...${RESET}"
git checkout main
git pull origin main
echo -e "${PURPLE}Pulling from GitHub...${RESET}"

if (( $FALL == 1 )); then
    buildType "Fall"
elif (( $WINTER == 1 )); then
    buildType "Winter"
else
    buildType "Fall"
    buildType "Winter"
    echo -e "${GREEN}Successfully deployed both Fall and Winter.${RESET}"
fi
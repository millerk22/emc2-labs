#!/usr/bin/env bash

set -euo pipefail

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
            echo "Error: Option -$OPTARG requires an argument." >&2
            exit 1;;
        \?)
            echo "Invalid option: -$OPTARG"
            echo "Usage: build_and_deploy.sh [f|w|a] -p path"
            exit 1;;
    esac
done

if (( $FALL + $WINTER + $ALL != 1 )); then
    echo "Only one argument allowed."
    echo "Usage: build_and_deploy.sh [f|w|a] -p path"
    exit 1
fi

buildType() {
    local Type="$1" # expects Fall or Winter (uppercase first letter)
    local type=$(echo "$Type" | tr '[:upper:]' '[:lower:]') # lowercase type (fall or winter)

    echo "Activating environment..."
    conda activate emc2_dev

    echo "Making html..."
    make -C "EMC2-Labs-$Type" clean
    make SPHINXOPTS="-W" -C "EMC2-Labs-$Type" html  # compile in -C directory and -W will treat warnings as errors

    status=$?
    if [ $status -ne 0 ]; then
        echo "Make failed with code $status."
        echo "Hint: You may need to fix the errors in red."
        exit 1
    fi

    read -p "User for math server: " MATH_USER
    read -s -p "Password for math server: " MATH_PASSWORD
    echo

    sshpass -p "$MATH_PASSWORD" scp -r -o StrictHostKeyChecking=no EMC2-Labs-$Type/_build/html/* "$MATH_USER@mathdept.byu.edu:$MATH_PATH/${type}-labs/"
    status=$?
    if [ $status -ne 0 ]; then
        echo "scp failed with code $status."
        exit 1
    fi

    echo "Successfully built and deployed $Type"
}

# Initialize conda
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
else
    echo "conda.sh not found"
    exit 1
fi

echo "Checking out main branch..."
git checkout main
git pull origin main
echo "Pulling from GitHub..."

if (( $FALL == 1 )); then
    buildType "Fall"
elif (( $WINTER == 1 )); then
    buildType "Winter"
else
    buildType "Fall"
    buildType "Winter"
    echo "Successfully deployed both Fall and Winter"
fi
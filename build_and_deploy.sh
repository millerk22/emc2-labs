#!/usr/bin/env bash

set -euo pipefail

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
            echo "Invalid option: -$OPTARG"
            echo "Usage: build_and_deploy.sh [f|w|a]"
            exit 1
            ;;
    esac
done

if (( $FALL + $WINTER + $ALL != 1 )); then
    echo "Only one argument allowed."
    echo "Usage: build_and_deploy.sh [f|w|a]"
    exit 1
fi

echo "Made it here"

git checkout main
echo "Made it there"
git pull origin main

# if (( $FALL == 1 )); then
#     cd "EMC2-Labs-Fall"
#     make html
    


# elif (( $WINTER == 1 )); then

# else

# fi
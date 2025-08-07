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

git checkout main
git pull origin main

read -p "User for math server: " MATH_USER
echo "GOT: $MATH_USER"
read -s -p "Password for math server: " MATH_PASSWORD
echo "Got password"
echo
echo "hello world" > tst.txt
sshpass -p "$MATH_PASSWORD" scp -o StrictHostKeyChecking=no tst.txt "$MATH_USER@mathdept.byu.edu:$MATH_PATH"





# if (( $FALL == 1 )); then
#     cd "EMC2-Labs-Fall"
#     make html
# elif (( $WINTER == 1 )); then
#     cd "EMC2-Labs-Winter"
#     make html
# else
#     cd "EMC2-Labs-Fall"
#     make html
#     status=$?
#     if [ $status -eq 0 ]; then
#         echo "Make failed with code $status."
#     fi

#     cd "../EMC2-Labs-Winter"
#     make html
# fi

# status=$?
# if [ $status -ne 0 ]; then
#     echo "Make failed with code $status."
# fi



#!/bin/bash -eu

GREEN="\033[0;32m"
BLUE="\033[0;36m"
NO_COLOR="\033[0m"

DEV_FOLDER=$1

if [ $# -ne 1 ]; then
  DEV_FOLDER=$(pwd)
fi

cd $DEV_FOLDER

echo $GREEN "Start" $NO_COLOR;

for repo in $(find . -name ".git" | cut -c 3- | rev | cut -c 6- | rev ); do
    echo $BLUE $repo $NO_COLOR;
    cd "$repo";
    git pull origin master;
    cd -
done

echo $GREEN "Done" $NO_COLOR;

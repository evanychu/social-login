#!/bin/bash
# This script builds the code.
# The $? variable contains the return value of last command.
# Return value 0 is success; else failure.


Command=$1

if [ "$Command" = "" ]; then
    echo "Error: Command is missing."
    exit 1
fi

if [ "$Command" = "gitlog" ]; then
    git log --oneline .
    exit $?
fi


if [ "$Command" = "clean" ]; then
    exit 0
fi


if [ "$Command" = "firebasehosting" ]; then
    # Upload files to Firebase Hosting.
    cd site
    firebase login
    firebase deploy
    exit 0
fi

if [ "$Command" = "localserver" ]; then
    # Run a Firebase-Hosting local server.
    cd site
    firebase serve
    exit 0
fi

echo "Error: Invalid command."
exit 1

#!/bin/sh
set -e

RESET="\033[0m"
GREEN="\033[32m✓"
YELLOW="\033[33m✗"

DIR=${1:-./}

if $(terraform fmt -write=false $DIR); then
    printf "$GREEN Module formatted ok $RESET\n"
else
    printf "$YELLOW Module formatted incorrectly.$RESET\n"
    exit 4
fi

# If we got here, all the tests passed
exit 0

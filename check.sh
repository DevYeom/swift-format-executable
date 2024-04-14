#!/usr/bin/env bash
set -e

# https://stackoverflow.com/a/5947802
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

function __verbose {
    echo $*
}
function __success {
    echo -e $GREEN$*$NC
}
function __warning {
    echo -e $YELLOW$*$NC
}
function __fail {
    echo -e $RED$*$NC
}

LATEST_VERSION=$(curl -s -L https://api.github.com/repos/apple/swift-format/releases/latest | sed -n 's/.*"tag_name": "\(.*\)".*/\1/p')
CURRENT_VERSION=$(cat .version)

if [ "$LATEST_VERSION" = "$CURRENT_VERSION" ]; then
    __success "The current version is the latest."
    exit 0
elif [ "$LATEST_VERSION" '>' "$CURRENT_VERSION" ]; then
    __fail "The latest version is not equal to the current version."
    exit 1
fi

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

# https://stackoverflow.com/a/246128
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR
SWIFT_FORMAT_VERSION=$(cat .version)

__verbose "Installing swift-format..."
rm -rf swift-format
git clone https://github.com/apple/swift-format.git
cd swift-format
git switch --detach "tags/$SWIFT_FORMAT_VERSION"
swift build -c release
cd $SCRIPT_DIR
cp swift-format/.build/release/swift-format ./swift-format-$SWIFT_FORMAT_VERSION
rm -rf swift-format
__success "swift-format is installed."

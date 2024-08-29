#!/bin/bash
set -e

source dev-container-features-test-lib

check "execute command" bash -c "xh --help"
check "execute command" bash -c "rg --help"

reportResults

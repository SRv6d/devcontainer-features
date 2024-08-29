#!/bin/bash
set -e

source dev-container-features-test-lib

check "execute command" bash -c "cargo-binstall -V | grep 'v1.10.2'"

reportResults

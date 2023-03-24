#!/bin/sh
set -e

# Make sure curl is installed
if ! type curl >/dev/null 2>&1; then
    apt-get update -y && apt-get -y install --no-install-recommends curl ca-certificates
fi 

echo "Installing Pyenv"

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

if [ $VERSION != "latest" ]; then
    export PYENV_GIT_TAG=v$VERSION
fi

curl -s -S -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

if [ $INSTALL != "None" ]; then
    read -a VERSIONS <<< "$INSTALL"
    for version in "${VERSIONS[@]}";
    do
        pyenv install $version
    done
fi

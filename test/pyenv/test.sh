set -e

source dev-container-features-test-lib

# Check that pyenv is installed
check "execute command" bash -c "pyenv --version"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults

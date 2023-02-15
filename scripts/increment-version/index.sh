#!/bin/sh

# We outlined what we need for this repository.
# But, we intend for you to fully configure this file on your own.

check_errors () {
  if [ $? -ne 0 ]; then
    echo "Something went wrong. Check above for output."
    exit 1
  fi
}

curdir=$(dirname $0)

# Execute all the desired scripts for your program here.
# Execute check_errors after each command.

# TIP: you can capture the new_version of a modified file from any script.

# $version_increment_type is an environment variable you can configure in your shell source config file.
# Its default value should be "patch". Change it to "minor" or "major" when applicable.

new_version=$("$curdir"/shields.sh -i $version_increment_type)
check_errors

# We find it useful to automate git actions after updating versions.
# You can bypass Husky Git Hooks by prepending HUSKY=0 to Git commands.
git commit -a -m "Update version to v$new_version"

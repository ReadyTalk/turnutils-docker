#!/bin/bash

if [ -z "$1" -a ! -f '.config' ]; then
    echo "You need to specify an endpoint or provide a .config list of servers"
    exit 1
fi

test() {
    docker rm -f turntest &> /dev/null
    docker run --name turntest -e TARGET=$host -itd readytalk/turnutils:latest &> /dev/null
    exit_code=$(docker wait turntest)

    if [[ "$exit_code" != 0 ]]; then
        echo "ERROR: $host server does not work"
    else
        echo "SUCCESS: $host is working!"
    fi
}


if [ -f '.config' -a -z "$1" ]; then
    echo "Using config file to run tests"
    while read endpoint; do
        host=$endpoint
        test
    done <.config
else
    host=$1
    test
fi

exit $exit_code

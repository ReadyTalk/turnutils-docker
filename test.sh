#!/bin/bash

if [ -z "$1" ]; then
    echo "You need to specify an endpoint"
    echo "Valid usage: ./test.sh turn.domain.com"
    exit 1   
fi

host=$1

echo "Beginning test for turn functionality against $host:443"

docker rm -f turntest &> /dev/null
docker run --name turntest -e TARGET=$host -itd readytalk/turnutils:latest &> /dev/null
exit_code=$(docker wait turntest)

if [[ "$exit_code" != 0 ]]; then
    echo "ERROR: This TURN server does not work"
else
    echo "SUCCESS! This TURN server is working!"
fi
echo "Run 'docker logs turntest' to see the output from the test"
exit $exit_code

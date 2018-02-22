[![Build Status](https://travis-ci.org/ReadyTalk/turnutils-docker.svg?branch=master)](https://travis-ci.org/ReadyTalk/turnutils-docker)

# Docker turn tester

## Requirements

Docker

## Usage

This is intended to verify the functionality of a turn server.  Just run it like this:

```
./test.sh <turn server url>
```

Alternatively you can specify a `.config` file with a list of turn servers.  The script will run through them.

```
./test.sh
```

## Customization

You can run different arguments for turnutils_uclient.  Just set ARGS in the test script.  

You can also specify the timeout for the commands in test.sh.  Set TIMEOUT variable. 

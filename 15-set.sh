#!/bin/bash

set -e      # automatic exit if there is any error

FAILURE(){
    echo "failed at line no: $1  ---> $2"
}

trap 'FAILURE "${LINENO}" "$BASH_COMMAND"' ERR     # ERR is error signal
echo "Hello world"
echoooo "Hello world failure"
echo "Hello world after failure"
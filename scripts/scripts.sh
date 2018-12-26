# /bin/bash

command_exists () {
    type "$1" &> /dev/null ;
}
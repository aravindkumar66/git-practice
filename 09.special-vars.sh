#!/bin/bash

echo "all variables passed to the script: $@"
echo "number of variables passed: $#"
echo "script name: $0"
echo "current working direcctory: $PWD"
echo "home directory of current user: $HOME"
echo  "pid of the script executing now: $$"
sleep 100 &
echo  "pid of the last bagruound command: $!"
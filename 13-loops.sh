#!/bin/bash

 USERID=$(id -u)
# #echo "User ID is: $USERID"

CHECK_ROOT(){
    IF [ $USERID -NE 0 ]
    then
        echo "please run this script with root previliges"
        exit1
}

VALIDATE(){
    if [ $? -ne 0 ]
    then
         echo "$2 command is failed"
         exit1
    else
         echo "$2 command is.. sucess"
    fi 

}
CHECK_ROOT

for package in $@ # $@ all arguments passed
do
    echo $package 

done
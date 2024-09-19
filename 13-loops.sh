#!/bin/bash

 USERID=$(id -u)
# #echo "User ID is: $USERID"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "please run this script with root previliges"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
         echo "$2 command is failed"
         exit 1
    else
         echo "$2 command is.. sucess"
    fi 

}

CHECK_ROOT

for package in $@ # $@ all arguments passed
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo "$package is not installed, going to install.."
        dnf install $package -y
        VALIDATE $? "installing $package"
    else 
        echo "$package is already installed.. nothing to do"
    fi
done
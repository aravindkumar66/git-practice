#!/bin/bash

 USERID=$(id -u)
# #echo "User ID is: $USERID"


if [ $USERID -ne 0 ]
then 
    echo "Please run this script with root priviliges"
    exit 1
fi

dnf list installed gitttt

if [ $? -ne 0 ]
then
    echo "git installed, going to install it"
    dnf install gitttt -y
    if [ $? -ne 0 ]
    then 
        echo "git installation not sucess..."
        exit 1
    else
        echo "git installation is sucess"
    fi
else
    echo "git is already installed, nothing to do.."
fi


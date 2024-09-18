#!/bin/bash

 USERID=$(id -u)
# #echo "User ID is: $USERID"

VALIDATE(){
    if [ $? -ne 0 ]
    then
         echo "$2 command is failed"
         exit1
    else
         echo "$2 command is.. sucess"
    fi 

}


if [ $USERID -ne 0 ]
then 
    echo "Please run this script with root priviliges"
    exit 1
fi

dnf list installed git

VALIDATE $? "listing git"

if [ $? -ne 0 ]
then
    echo "git not installed, going to install it"
    dnf install git -y
    VALIDATE $? "Installing git...."
else
    echo "git is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed... going to install"
    dnf install mysql -y
    VALIDATE $? "installing mysql..."
else
    echo "mysql is already installed, nothing to do..."
fi 


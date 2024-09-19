#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
# #echo "User ID is: $USERID"
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R please run this script with root previliges $N" &>>$LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
         echo "$2 command is failed" &>>$LOG_FILE
         exit 1
    else
         echo "$2 command is.. sucess" &>>$LOG_FILE
    fi 

}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh 14-Redirectory.sh package1,package2.. "
    exit 1
}

echo "script started executing at: $date"

CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@ # $@ all arguments passed
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo "$package is not installed, going to install.."
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "installing $package"
    else 
        echo -e "$package is already $Y installed.. nothing to do $N" &>>$LOG_FILE
    fi
done
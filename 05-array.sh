#!/bin/bash

Language=("java" "python" "dotnet" "nodejs" "html")

echo "first word is: ${LANGUAGE[0]}"
echo "second word is: ${LANGUAGE[1]}"
echo "third word is: ${LANGUAGE[2]}"
echo "fourth word is: ${LANGUAGE[3]}"

echo "first word is: ${LANGUAGE[@]}"
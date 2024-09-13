#!/bin/bash

Language=("java" "python" "dotnet" "nodejs" "html")

echo "first word is: ${Language[0]}"
echo "second word is: ${Language[1]}"
echo "third word is: ${Language[2]}"
echo "fourth word is: ${Language[3]}"

echo "first all words are: ${Language[@]}"
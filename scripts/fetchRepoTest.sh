#!/bin/bash

function outputTestResult {
    if [ $1 -eq $2 ]; then
        echo "Test Passed"
    else
        echo "Test Failed"
    fi
}

echo "----------------"

echo "Fetch User1 Repo Test"
expectedCode=0
"./fetchRepo.sh" "/Users/jeremiahliao/Desktop/HopeKCC/Web Dev/hopekcc-github-test" user1 "/Users/jeremiahliao/Desktop/HopeKCC/Web Dev/hopekcc-web-mock" "team-os"
outputTestResult $? $expectedCode

echo "-----------------"

echo "Reset User1 Test"
expectedCode=0
"./resetRepo.sh" "/Users/jeremiahliao/Desktop/HopeKCC/Web Dev/hopekcc-web-mock" "team-os" user1 
outputTestResult $? $expectedCode

echo "----------------"

echo "Fetch User1 Repo with existing web directory made" 
expectedCode=0
mkdir -p "/Users/jeremiahliao/Desktop/HopeKCC/Web Dev/hopekcc-web-mock/team-os/"
"./fetchRepo.sh" "/Users/jeremiahliao/Desktop/HopeKCC/Web Dev/hopekcc-github-test" user1 "/Users/jeremiahliao/Desktop/HopeKCC/Web Dev/hopekcc-web-mock" "team-os"
outputTestResult $? $expectedCode

echo "" 
echo "Cleanup: Remove web directory"
"./resetRepo.sh" "/Users/jeremiahliao/Desktop/HopeKCC/Web Dev/hopekcc-web-mock" "team-os" user1 
rm -r "/Users/jeremiahliao/Desktop/HopeKCC/Web Dev/hopekcc-web-mock/team-os/"

echo "----------------"

echo "Fetch nonexistent branch"
expectedCode=1
"./fetchRepo.sh" "/Users/jeremiahliao/Desktop/HopeKCC/Web Dev/hopekcc-github-test" nonuser "/Users/jeremiahliao/Desktop/HopeKCC/Web Dev/hopekcc-web-mock" "team-os"
outputTestResult $? $expectedCode
echo "-----------------"

echo "Change to broken directory"
expectedCode=1
"./fetchRepo.sh" "/brokendirectory" user1 "/Users/jeremiahliao/Desktop/HopeKCC/Web Dev/hopekcc-web-mock" "team-os"
outputTestResult $? $expectedCode
echo "-----------------"
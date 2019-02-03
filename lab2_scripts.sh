#!/bin/bash
# Authors : Alyvia Hildebrand & Jason Hong
# Date: 1/30/19

#Problem 1 Code:
#Make sure to document how you are solving each problem!

echo "Enter a file name: "
read file
echo "Enter an argument: "
read arg
grep $arg $file

#count phone numbers
echo "Total phone numbers: "
grep -c '[0-9]\{3\}\-[0-9]\{3\}\-[0-9]\{4\}' $file

#count emails
echo "Total emails: "
grep -c  "^.*@.*.com" $file

#creating phone_results.txt
grep "^.*@.*.com" $file > "emails.txt"
echo "Copying phone numbers with 303 area code to phone_results.txt."
grep '303-' $file > "phone_results.txt"

#creating email_results.txt
echo "Copying emails not from geocities to email_results.txt"
grep -v 'geocities.com' emails.txt > "email_results.txt"

#creating command_results.txt
echo "Copying list of lines that match argument into command_results.txt"
grep $arg $file > "command_results.txt"

#add to git
git init
git add .
git commit -m "Storing emails.txt, phone_results.txt, email_results.txt and command_results.txt"
git remote add origin https://github.com/alhi7404/lab_2.git
git push origin master

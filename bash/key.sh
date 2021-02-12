#!/bin/bash

################################################
## script to generate key pairs, pem files
## and public keys on AWS
## 
## Add the name of the keis you want to 
## generate in a users.txt file in the 
## same directory and run the script
##
## It will create the Key pair in the EC2 
## Console and right a pem and a pub file locally
## with you private and public key respectively
##
################################################

for line in $(cat users.txt)  ;
do  
u=`echo $line | tr -d '\r'`
echo $u
aws ec2 create-key-pair --key-name $u | jq -r ".KeyMaterial" >> $u.pem
ssh-keygen -y -f $u.pem > $u.pub
echo - { name: \"$u\", key: \"`cat $u.pub`\"} >> file.yml
done
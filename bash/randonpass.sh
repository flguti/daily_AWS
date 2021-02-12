#!/bin/bash
echo "Password Length"
read l
echo "Number of password to be generated"
read n
for i in `seq $n`; do tr -dc 'A-Za-z0-9!"#%&$\()*+,-./:;<=>?@[\]^_{|}~' </dev/urandom | head -c $l  ; echo; done
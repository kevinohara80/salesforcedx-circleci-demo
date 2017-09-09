#!/bin/bash

echo "Server keys will be added to this folder."
echo "Press CTRL-C to cancel or RETURN to proceed"

read check1

openssl genrsa -des3 -passout pass:x -out server.pass.key 2048
openssl rsa -passin pass:x -in server.pass.key -out server.key
rm server.pass.key

echo -e "\n\n\n\n"
echo "We will now generate the server key"
echo "Be sure to use a blank password for the certificate to work"
echo "Press RETURN to proceed"

read check2

openssl req -new -key server.key -out server.csr

echo "we will now generate the certificate"
echo "Press RETURN to proceed"

echo -e "\n\n\n\n"
read check3

openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt

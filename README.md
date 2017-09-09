# salesforcedx-circleci-demo
A demo project showing a Salesforce project being built with SalesforceDX and CircleCI

## Overview

CircleCI is a Continuous Integration service. This project demonstrates how to use Salesforce DX
with Circle.

Follow the instructions below to get started. Also, take a look the 
[SFDX Travis CI](https://github.com/wadewegner/sfdx-travisci). This project 
is similar in implementation.

## Instructions

1. Generate a an [SSL server key and certificate](https://devcenter.heroku.com/articles/ssl-certificate-self)

See `keys/makeServerKey.sh` as an example you can build upon.

2. Convert it to hex for storing in Circle's env variables. 

  > Circle does a nice job of allowing you to set environment variables inside the UI in a 
  protected way. Because OpenSSL likes key files formatted in a particular fashion, we'll convert 
  it to hex for storage in env variables. This will make it easier to create a valid key file 
  on the fly in the build later.
  
  ```bash
  $ xxd -p server.key >> server.key.hex
  ```
3. Set up a Connected App in Salesforce for use with the JWT auth flow.

  * Check `Enable OAuth Settings`
  * Set the OAuth callback to `http://localhost:1717/OauthRedirect`
  * Check `Use Digital Signatures` and add your certificate (likely `server.crt`) from step (1)
  * Select the required OAuth scopes
  * Once saved, click `Manage` to set up policies. I used "Admin Approved" for the permitted users
  and added the correct profiles to the app.
  * Verify JWT works through the following command:

  >sfdx force:auth:jwt:grant --clientid [[consumer-key]] --jwtkeyfile path/to/server.key --username [[username]]
  
4. Create a project in github, set it up for use with SFDX, and add source files

5. Add the project to your CircleCI account

6. Configure CircleCI variables inside of the settings for your project

  * `CONSUMER_KEY`: Your Connected App consumer key
  * `SERVER_KEY_HEX`: The hex version of your server key from step 2
  * `SFDC_USER`: The username for your Salesforce user
  
7. Add the example `circle.yml` and push some commits to your repo to start building

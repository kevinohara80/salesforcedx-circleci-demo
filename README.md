# salesforcedx-circleci-demo
A demo project showing a Salesforce project being built with SalesforceDX and Circle CI

## Overview

Circle CI is a Continuous Integration service. This project demonstrates how to use Salesforce DX
with Circle.

Follow the instructions below to get started. Also, take a look the 
[SFDX Travis CI](https://github.com/wadewegner/sfdx-travisci). This project 
is similar in implementation.

## Instructions

1. Generate a an [SSL server key and certificate](https://devcenter.heroku.com/articles/ssl-certificate-self)

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
  
4. Create a project in github and add your source files

5. Add the project to your Circle CI account

6. Configure CircleCi variables inside of the settings for your project

  * `CONSUMER_KEY`: Your Connected App consumer key
  * `SERVER_KEY_HEX`: The hex version of your server key from step 2
  * `SFDC_USER`: The username for your Salesforce user
  
7. Add the example `circle.yml` and push some commits to your repo to start building

# salesforcedx-circleci-demo
A demo project showing a Salesforce project being built with SalesforceDX and Circle CI

## Instructions

1. Generate a an [SSL server key and certificate](https://devcenter.heroku.com/articles/ssl-certificate-self)

2. Convert it to hex for storing in Circle's env variables
  
  ```bash
  $ xxd -p server.key >> server.key.hex
  ```

3. Configure CircleCi variables inside of the settings for your project

  * `CONSUMER_KEY`: Your Connected App consumer key
  * `SERVER_KEY_HEX`: The hex version of your server key
  * `SFDC_USER`: The username for your Salesforce user
  
More instructions coming soon...

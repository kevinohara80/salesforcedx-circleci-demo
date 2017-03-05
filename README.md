# salesforcedx-circleci-demo
A demo project showing a Salesforce project being built with SalesforceDX and Circle CI

## Instructions

1. Generate a an [SSL server key and certificate](https://devcenter.heroku.com/articles/ssl-certificate-self)

2. Convert it to hex for storing in Circle's env variables

```bash
$ xxd -p server.key >> server.key.hex
```

3. More...
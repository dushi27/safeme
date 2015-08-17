##SafeMe

Safeme enable users to alert their network if in a threatening situation with the simple press of their Jawbone fitness tracker

##Technical Specs

Safeme is Ruby on Rails app that integrate Jawbone API via oAuth2 to recognize an alert, Twilio API for messaging and calls, and Bootstrap for frontend.

##Creating a Local Copy and Testing

Step 1: Click the 'Fork' button on the top right on your screen. That will create a copy of the repo under your Github username.

Step 2: In your command line/ terminal run

```bash
$ git clone GIT CLONE URL 
```
GIT CLONE URL = https://github.com/INSERT YOUR USERNAME/Twitter.git or you can copy the "HTTP CLONE url"

Step 3: Run the following commands 
to install the necessary gems 
```bash
$ bundle install 
```
to migrate the database (This repository use Rails 4.1.1 if you are using older version migrate the test environment): 
```bash
$ rake db:migrate
```

to run project in a  locally
```bash
$ rails s 
```
NOTE: remember to add your Twilio credentials to environment variables to following variables before running the app
TWILLIO_SID
TWILLIO_TOKEN
TWILLIO_NUMBER

To set environment variables on Linux environment
```bash
$ export SAMPLE_ENV_VAR=sunday
```

To see environment variables on Linux environment
```bash
$ printenv SAMPLE_ENV_VAR
```

 
###Testing 

The application uses <a href="http://guides.rubyonrails.org/testing.html" traget="_blank">Rails test suite</a> for automated testing. All the tests are located in the test directory. 

To run all the existing tests;
```bash
$ rake test test/
```
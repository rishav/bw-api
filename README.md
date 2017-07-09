# README

# SETUP

* `git clone`
* `cd bw-api`
* `rvm install 2.3.1`
* `rvm use 2.3.1`
* `gem install bundler`
* `bundle install`
* `bin/rake db:migrate`
* `bin/rake db:seed`
* `export MAILGUN_API_KEY='YOUR_API_KEY'`
* `export SENDGRID_API_KEY='YOUR_API_KEY'`
* `bin/rails s`
* `redis-server`
* `bundle exec sidekiq` (Please remember to export the API keys using above command when running this or whereever running any rails console or server)

## To Run tests

`rake test`

## Basic Premise

POST requests creates a record of BrightWheelEmail class in the database which triggers a async job (using sidekiq) to send the email.
There is a EmailProviders table that I use to decide which is the current active email provider ( using the `active` column in the database), if there are muliple active email providers it picks the first one.

## Future Enhancements

* Cleanup some of the tests, one or two integration tests.
* There is crummy delegator code in email_provider.rb, needs cleanup
* This whole thing can integrated into ActionMailer and used as a delivery_method
* Abstract out MailGun and Sendgrid EmailProvider with base methods and behavior, further enhance this by storing responses from each provider and storing them for review later
* Currently only sending an HTML version of the body, not sending a plain text version of the email which would be simple to add.
* Using Sanitize to clean the body html, may need to look deeper into what type of HTML tags we should whitelist

## Note

* My Sendgrid account was suspended while running final tests. May need to update once I get a response from their support.
* Mailgun has a domain setting, which might be necessary to test this, I tested this with the "from email" provided with the test domain mailgun provides when setting up the account

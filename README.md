# JobHuntingApplication

Please read the problem statement [here](https://docs.google.com/document/d/1NiLvnbmIVmiFco5iQuptvy5Om2c9DLp_ntOByDIdU6A/edit)

**Live Version:** [https://fathomless-coast-87074.herokuapp.com/](https://fathomless-coast-87074.herokuapp.com/)

## Usage

It is easily navigable and all the features have been implemented as per the problem statement. You could login as an admin or a realtor or a house hunter and perform their respective activities.

## Administrator Credentials

Email - admin@ncsu.edu
Password - admin

## Setup

- Tested on Ruby [2.4.4](https://www.ruby-lang.org/en/downloads/releases/)

- Run `bundle install` to install the required gems

- Run `rake db:migrate` to setup the database

- Start the application by running `rails server`

- You can visit the app at [http://localhost:3000](http://localhost:3000)

## Testing

- Run `bundle install` to install the required gems

- Run `rake db:migrate RAILS_ENV=test` to setup the test database

- Run `bundle exec rspec` to see the test reports

# Webhook Rails
[Intro](#webhook-rails) | [Getting Started](#getting-started) | [Notes](#notes)

Initial set up of the ~~mandrill.go~~ `llirdnam.go` application was a bit tricky because I hadn't ever touched/seen Go code before! I also had little idea what webhooks were, so it was doubly unfamiliar. However I managed to get through those hurdles just fine, and this is my working prototype :smile:
&nbsp;

#### Application UI
![Application screenshot](/screenshot.png)

#### Snapshot of database table
![Database screenshot](/screenshot-psql.png)

&nbsp;
### Getting Started

#### Prerequisites
- [homebrew](http://brew.sh/)
- [ruby](https://www.ruby-lang.org/en/)

#### Installation (OS X)
1. Install and configure postgresql if you haven't already:

  `brew install postgresql`
  ```
  ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  ```

1. Create the necessary databases:

	`psql postgres`
  ```
  create database lostmyemails_development;
  create database lostmyemails_test;
  \q
  ```

1. Run `bundle install` to install other dependencies
1. Migrate the database with `bin/rails db:migrate RAILS_ENV=development`


#### Server
1. Start the server with `bin/rails s`
1. Point the `llirdnam.go` output at http://localhost:3000/emails
1. Go to [localhost:3000](http://localhost:3000)

#### Testing
Run tests with `rspec`


&nbsp;
### Notes

#### Ruby on Rails
_Why Rails rather than just a Ruby/Sinatra setup?_<br>
Whilst Rails does add many extra unnecessary files for the task, it makes the  initial setup so incredibly fast that I don't need to spend much time configuring.

#### PostgresSQL
_Why not use the default, SQLite?_<br>
Postgres is generally what I've been taught to use - it is tried and tested, and I know how to use it! SQLite is just fine, but I've had issues in the past trying to deploy a Rails app to Heroku because of it.

#### Class methods on Email model
It just didn't make sense to encapsulate `#calculate_rate` in a `Calculator` class for example, because the method is only ever used on data from the `Email` model.

#### Column names
Initially, my table column names were: `address`, `type`, `event`. It turns out that `type` is a restricted word and I couldn't use it as a column name. I mistakenly thought it was a good idea to change it to `category` instead, but it got very confusing because the corresponding webhook data was called `EmailType`. In the end, I created a migration to rename the column to `email_type`.

#### Timestamp webhook data
Rails automatically adds a `created_at` column. After having a look at the `llirdnam.go` generator, I noticed that it generates a timestamp which is the current time anyway, so I chose not to use the posted timestamp to avoid data duplication.

#### UI
As much as table layouts remind me of 90s web design, there are instances in which they are necessary — displaying data for example! I identified 2 separate sets of data and split them into tables accordingly. Other than making it readable, I haven't really done any further styling because it wasn't a requirement.


&nbsp;
### Bonus
This isn't strictly part of the test, but I thought I'd use this opportunity to have a play with WebSockets. If you'd like to see, checkout the `action-cable` branch. The tables of data reload when triggered by the incoming webhook.

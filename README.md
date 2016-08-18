# Webhook Rails

&nbsp;
![](/screenshot.png)

&nbsp;
### Getting Started

#### Prerequisites
- [homebrew](http://brew.sh/)
- [ruby](https://www.ruby-lang.org/en/)

#### Installation
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
1. Point the `llirdnam.go`<sup>(it's `mandrill` backwards!)</sup> output at http://localhost:3000/emails
1. Go to [localhost:3000](http://localhost:3000)

#### Testing
Run tests with `rspec`

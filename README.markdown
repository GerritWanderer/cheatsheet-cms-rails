## Cheatsheet CMS for Ruby on Rails 3

### Overall Goals
  - Creating a Multi-User Interface for managing and sharing your own cheatsheets
  - Full BDD with Cucumber and rSpec
  - More Interface-Design with lessCSS, 960.gs and CSS3PIE
  - Integrate some fancy jQuery-PlugIns

- - -

### Installation
`bundle install && rake db:migrate`

**Integrated Gems:**

  - `devise`
  - `rspec-rails`
  - `cucumber-rails`
  - `machinist`
  - `email_spec`

**You need to change your SMTP-Server Settings for sending mails with Devise.**

Take a look into `./config/initzializers/setup_mail.rb` and choose your way of setting up env-variables or paste it as direct input:

### Demo
You can find a Demo at [Heroku](http://cheatsheets.heroku.com "Cheatsheet CMS at Heroku")
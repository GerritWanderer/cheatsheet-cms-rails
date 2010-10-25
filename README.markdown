** Cheatsheet CMS for Ruby On Rails.**

_Overall goals:_

* Creating a Multi-User Interface for managing and sharing your own cheatsheets
* Implement the most fancyiest jQuery-PlugIns
* More Interface-Design with lessCSS and 960.gs
* Full BDD with Cucumber and rSpec

------------------

_Whatch out:_
For the following config settings i selected Env-Variables. Be sure to set the env-variables or use the direct input.

SMTP-Settings... (./config/initializers/setup_mail.rb)
ENV['SMTP_SERVER'] = 'mail.example.org'
ENV['SMTP_DOMAIN'] = 'example.org'
ENV['SMTP_USER'] = 'exampleuser'
ENV['SMTP_PASSWORD'] = 'examplepassword'

Mailer default URL...  (./config/application.rb)
ENV['DEFAULT_URL_OPTIONS'] = 'localhost:3000'
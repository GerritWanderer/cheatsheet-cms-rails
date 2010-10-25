# !!! WATCH OUT !!!
# The sensitive data for SMTP-Access are stored as config vars at heroku (http://docs.heroku.com/config-vars)
# execute the following command with the smtp-data from your terminal
# user$ heroku config:add SMTP_SERVER=mail.example.org SMTP_DOMAIN=example.org SMTP_USER=exampleuser SMTP_PASSWORD=examplepassword
# or change the additional direct input

ActionMailer::Base.smtp_settings = {  
  :address              => ENV['SMTP_SERVER'] || 'mail.example.org',
  :port                 => 25,  
  :domain               => ENV['SMTP_DOMAIN'] || 'example.org',
  :user_name            => ENV['SMTP_USER'] || 'exampleuser',
  :password             => ENV['SMTP_PASSWORD'] || 'examplepassword',
  :authentication       => "plain",  
  :enable_starttls_auto => false  
}
ActionMailer::Base.smtp_settings = {  
  :address              => "mail.example.org",  
  :port                 => 25,  
  :domain               => "example.org",  
  :user_name            => "user",  
  :password             => "password",  
  :authentication       => "plain",  
  :enable_starttls_auto => false  
}
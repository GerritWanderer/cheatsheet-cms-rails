require 'machinist/active_record'

User.blueprint do
  id { "#{sn}" }
  email { "admin@wildner-designer.de" }
  encrypted_password { "$2a$10$eXd5IqY3bhN1dIyrOvNgr.h3ztjjdBySTjNJvOiwNS3jMRdGfW7mi" }
  password_salt { "$2a$10$eXd5IqY3bhN1dIyrOvNgr." }
end

Sheet.blueprint do
  user
  id { "#{sn}" }
  name { "Sample Cheatsheet" }
  description { "Lorem ipsum..." }
end

Category.blueprint do
  sheet
  id { "#{sn}" }
  name { "Sample Category" }
  column { "left" }
  position { "1" }
end

Cheat.blueprint do
  category
  id { "#{sn}" }
  name { "Sample Cheat" }
  preview { "Lorem ipsum..." }
  position { "1" }
end
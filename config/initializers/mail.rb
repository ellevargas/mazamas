ActionMailer::Base.smtp_settings= {
  address: "smtp.mandrillapp.com",
  port: 587,
  enable_starttls_auto: true;
  user_name: ENV["Mazamas"],
  password: ENV["SMTP_PASSWORD"],
  authentication: "login",
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: ''

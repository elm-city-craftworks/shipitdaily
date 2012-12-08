ctionMailer::Base.smtp_settings = {
  :address              => "smtp.sendgrid.net",
  :port                 => 587,
  :domain               => "practicingruby.com",
  :user_name            => ENV["MAIL_USER"],
  :password             => ENV["MAIL_PASSWORD"],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

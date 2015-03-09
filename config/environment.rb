# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Depot::Application.configure do
config.action_mailer.delivery_method = :smtp

config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "gmail.com",
  authentication: "plain",
  user_name: "tushartitame@gmail.com",
  password: "lasthalf_108",
  #enable_starttls_auto: true
}
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true
ActionMailer::Base.default_url_options = { host: "localhost:3000"}
config.action_mailer.default_url_options = { host: "localhost:3000" }
end

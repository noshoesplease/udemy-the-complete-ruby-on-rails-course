# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# smtp settings
ActionMailer::Base.smtp_settings = {
  address: "smtp.sendgrid.net",
  port: 587,
  authentication: :plain,
  user_name: ENV["SENDGRID_USERNAME"] || Rails.application.credentials.dig(:sendgrid, :username),
  password: ENV["SENDGRID_PASSWORD"] || Rails.application.credentials.dig(:sendgrid, :apikey),
  domain: "heroku.com",
  enable_starttls_auto: true
}

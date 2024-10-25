Rails.configuration.stripe = {
  secret_key: ENV["STRIPE_TEST_SECRET_KEY"] || Rails.application.credentials.stripe[:secret_key],
  publishable_key: ENV["STRIPE_TEST_PUBLISHABLE_KEY"] || Rails.application.credentials.stripe[:publishable_key]
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]

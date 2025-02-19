# Rails.configuration.stripe = {
#   publishable_key: ENV["STRIPE_PUBLISHABLE_KEY"],
#   secret_key: ENV["STRIPE_SECRET_KEY"]
# }

Rails.configuration.stripe = {
  publishable_key: Rails.application.credentials.dig(:stripe, :publishable_key),
  secret_key: Rails.application.credentials.dig(:stripe, :secret_key)
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

class Payment < ApplicationRecord
  attr_accessor :card_number, :card_cvc, :card_expires_month, :card_expires_year
  belongs_to :user

  def process_payment
    # debugger
    customer = Stripe::Customer.create(email: email, card: token)
    Stripe::Charge.create(
      customer: customer.id,
      amount: 1000,
      description: "Premium",
      currency: "usd"
    )
  end
end

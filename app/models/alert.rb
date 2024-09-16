class Alert < ApplicationRecord
	acts_as_paranoid

	belongs_to :user

	validates :crypto_currency, presence: true
	validates :target_price, presence: true
	validates :status, inclusion: { in: %w(created triggered deleted),
    message: "%{value} is not a valid status" }
  validates :crypto_currency, inclusion: { in: %w(btc eth usdt bnb sol usdc xrp steth doge ton trx ada),
    message: "%{value} is not a valid crypto currency symbol" }
end

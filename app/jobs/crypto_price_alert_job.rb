class CryptoPriceAlertJob < ApplicationJob
  queue_as :default

  def perform(*args)
    SendBinanceAlertToUserService.new.call
  end
end
class CryptoPriceAlertJob < ApplicationJob
  queue_as :default

  def perform(*args)
    SendBinanceRealTimeDataUpdateToUserService.new.call
  end
end
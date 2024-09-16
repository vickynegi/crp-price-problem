class SendTargetPriceAlertToUserViaEmailJob < ApplicationJob
  queue_as :default

  def perform(data)
    alerts = Alert.includes(:user).where('crypto_currency =? AND status =? AND target_price <= ?', crypto_currency[data['s']], "created", data['p'].to_f)

    alerts.find_each(batch_size: 500) do |alert|
      alert.update(status: "triggered")
      AlertMailer.with(alert: alert).send_price_alert_to_user.deliver_now
    end
  end

  private

  ## adding the crypto currency symbol. Added only 2 symbols, we can keep adding more.
  def crypto_currency
    {'BTCUSDT' => 'btc', 'BNBUSDT' => 'bnb'}
  end
end
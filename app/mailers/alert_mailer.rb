class AlertMailer < ApplicationMailer
  def send_price_alert_to_user
    @alert = params[:alert]

    mail(to: @alert.user.email, subject: 'Your Cryptocurrency Price Alert got Triggered')
  end
end
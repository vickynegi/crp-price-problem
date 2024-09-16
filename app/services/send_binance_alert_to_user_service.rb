require 'faye/websocket'
require 'eventmachine'

class SendBinanceAlertToUserService

	def initialize;end

	## https://developers.binance.com/docs/binance-spot-api-docs/web-socket-streams
	def call
		EM.run {
		  ws = Faye::WebSocket::Client.new('wss://stream.binance.com:9443/ws/btcusdt@aggTrade')

		  ws.on :open do |event|
		    p "Connection has been established."
		  end

		  ws.on :message do |event|
		    send_alert_to_users(event.data)
		  end

		  ws.on :close do |event|
		    p [:close, event.code, event.reason]
		    ws = nil
		  end
		}
	end

	def send_alert_to_users(data)
		SendTargetPriceAlertToUserViaEmailJob.perform_now(JSON.parse(data))
	end
end

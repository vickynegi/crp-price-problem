require 'faye/websocket'
require 'eventmachine'

class SendBinanceRealTimeDataUpdateToUserService

	def initialize;end

	def call
		EM.run {
		  ws = Faye::WebSocket::Client.new('wss://stream.binance.com:9443/ws/btcusdt@aggTrade')

		  ws.on :open do |event|
		    p "Connection has been established."
		  end

		  ws.on :message do |event|
		    JSON.parse(event.data)
		  end

		  ws.on :close do |event|
		    p [:close, event.code, event.reason]
		    ws = nil
		  end
		}
	end
end

# README

Prequisites:-
1) Ruby version - 3.3.1

2) Rails version - 7.1.3

3) Database - postgres

4) Docker

5) Docker Compose

Docker:-
docker-compose up

6) Manual Setup: - Run the following commands in terminal
   a) bundle install
   b) rails server
   c) redis-server
   d) sidekiq

Note: After running the sidekiq, cronjob (crypto_price_alert_job) will run. This will hit the "CryptoPriceAlertJob" Job & call the "SendBinanceAlertToUserService" Service class which will fetch the Binance BTCUSDT data. This Service class will call another "SendTargetPriceAlertToUserViaEmailJob" Job which will update the status of alert & send the email to the users. I have integrated only "letter_opener" gem to send the email. 


API Endpoints:-
1) To create the users - Please enter this on terminal - rake db:seed

2) User login POST API - "/v1/sign_in" , Request body: {"email": "roshan@gmail.com", "password": "Action$@1"}

3) To list all alerts -  GET API - "/v1/alerts?page=1&per_page=20&status=triggered"
 where status = "triggered/created/deleted"

4) To create an alert - POST API - "/v1/alerts", {"crypto_currency": "btc", "target_price": 124234.24}
Some allowed values of crypto_currency: btc eth usdt bnb sol usdc xrp steth doge ton trx ada

5) To delete an alert - DELETE API - "v1/alerts/alert_id"

Email Settings:-
9) Integrated only letter_opener to send the email. 

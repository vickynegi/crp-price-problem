# README

1) Ruby version - 3.3.1
2) Rails version - 7.1.3
3) Database - postgres
4) To create the users - Please enter this on terminal - rake db:seed
5) User login POST API - "/v1/sign_in" , Request body: {"email": "roshan@gmail.com", "password": "Action$@1"}
6) To list all alerts -  GET API - "/v1/alerts?page=1&per_page=20&status=triggered"
7) To create an alert - POST API - "/v1/alerts", {"crypto_currency": "btc", "target_price": 124234.24}
Some allowed values of crypto_currency: btc eth usdt bnb sol usdc xrp steth doge ton trx ada
8) To delete an alert - DELETE API - "v1/alert_id/alerts"
9) Integrated only letter_opener to send the email. 

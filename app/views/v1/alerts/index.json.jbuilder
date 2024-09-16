json.alerts @alerts do |alert|
  json.id alert.id
  json.crypto_currency alert.crypto_currency.upcase
  json.status alert.status
  json.target_price alert.target_price
  json.user_id alert.user_id
  json.user_name @user_name
end

json.total_no_of_pages @alerts.total_pages
json.total_no_of_records @total_alerts.count
json.per_page @alerts.per_page

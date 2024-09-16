module JsonWebToken

  # Generate JWT Token
  def self.generate_token(payload, exp=36.hours.from_now)
    payload[:exp] = exp.to_i
    token = JWT.encode(payload, Rails.application.secret_key_base)
    eval("'JWT ' + token")
  end

  # Decode JWT Token
  def self.decode_token(token)
    begin
      actual_token = token.split(' ').last
      JWT.decode(actual_token, Rails.application.secret_key_base).first
    rescue Exception => e
      return [400, e.to_s]
    end
  end
end

CONFIG = Rails.application.config_for('redis', env: Rails.env)
ConnectionPool.new(pool_size: CONFIG.dig(:redis, :pool_size), timeout: CONFIG.dig(:redis, :timeout)) { Rails.env.test? ? MockRedis.new : Redis.new(url: ENV['REDIS_DEFAULT_URL']) }

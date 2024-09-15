require 'sidekiq/web'
require 'sidekiq-scheduler'
require 'sidekiq-scheduler/web'

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(Rails.root.join('lib/schedulers', 'development_sidekiq_scheduler.yml'))
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.logger.level = ActiveSupport::Logger::INFO
  config.logger.formatter = Sidekiq::Logger::Formatters::JSON.new
end

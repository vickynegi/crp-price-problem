require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CrpPriceProblem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    config.before_configuration do
      rails_env = Rails.env
      ['development_env'].each do |file|
        env_file = File.join(Rails.root, 'config', "#{file}.yml")
        YAML.load(File.open(env_file)).each do |key, value|
          ENV[key.to_s] = value
        end if File.exist?(env_file)
      end
    end

    config.active_job.queue_adapter = :sidekiq

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Kolkata"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

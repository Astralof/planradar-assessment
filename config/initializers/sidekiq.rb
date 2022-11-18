# Set the Sidekiq log level to the Rails log level
Sidekiq.configure_server do |config|
  config.logger.level = Rails.logger.level
end
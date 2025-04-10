Sentry.init do |config|
  config.dsn = ENV['SENTRY_URL']
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  config.enabled_environments = %w(staging production)
  config.traces_sample_rate = 1.0
end

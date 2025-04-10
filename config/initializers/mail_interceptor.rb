require 'sandbox_email_interceptor'

Rails.application.configure do
  if (Rails.env.staging? || Rails.env.development?) && ENV.fetch('DEFAULT_STAGING_TO_ADDRESS', false)
    config.action_mailer.interceptors = %w[SandboxEmailInterceptor]
  end
end

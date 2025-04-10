class SandboxEmailInterceptor
  def self.delivering_email(message)
    message.subject = "[#{Rails.env}] #{message.subject}"
    message.to = ENV.fetch('DEFAULT_STAGING_TO_ADDRESS', nil)
  end
end

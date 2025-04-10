require Rails.root.join("config/environments/production")

# Staging shares most production configuration.
# Any staging-specific configuration can go here.
Rails.application.configure do
  # config.middleware.insert_before 0, Rack::Cors do
  #   allow do
  #     origins ENV['CLIENT_URL']
  #     resource "*",
  #       headers: :any,
  #       methods: [:get, :post, :put, :patch, :delete, :options, :head]
  #   end
  # end
end
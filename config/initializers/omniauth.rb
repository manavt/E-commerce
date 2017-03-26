OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1794085500916419', '6595741b74442c04b6403a96df20c41d'
end

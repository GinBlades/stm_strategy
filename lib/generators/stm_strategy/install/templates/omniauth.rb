# Set the following values in secrets.yml:
#   auth_provider_url:
#   auth_provider_application_id:
#   auth_provider_secret:
PROVIDER = Rails.application.secrets.auth_provider_url
SETUP_PROC = lambda do |env|
  env['omniauth.strategy'].options[:client_id] = Rails.application.secrets.auth_provider_application_id
  env['omniauth.strategy'].options[:client_secret] = Rails.application.secrets.auth_provider_secret
  env['omniauth.strategy'].options[:client_options].site = PROVIDER
  env['omniauth.strategy'].options[:client_options].authorize_url = "#{PROVIDER}/oauth/authorize"
  env['omniauth.strategy'].options[:client_options].access_token_url = "#{PROVIDER}/oauth/token"
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stm, setup: SETUP_PROC
end

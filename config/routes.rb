Rails.application.routes.draw do
  # omniauth
  get '/auth/:provider/callback', :to => 'stm_strategy/user_sessions#create'
  get '/auth/failure', :to => 'stm_strategy/user_sessions#failure'

  # Custom logout
  post '/logout', :to => 'stm_strategy/user_sessions#destroy'
end

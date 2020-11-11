Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'static#homepage'
  get '/privacy', to: 'static#privacy'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :characters, :goals, :motivations, :tactics, :prompts
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'static#homepage'
  get '/privacy', to: 'static#privacy'
  devise_for :users
  resources :characters, :goals, :motivations, :tactics, :prompts
end

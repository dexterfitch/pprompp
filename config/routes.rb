Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#homepage'
  get '/privacy', to: 'static#privacy'
  get '/users/:id/my_characters', to: 'characters#index_mine', as: :index_mine
  get '/users/:id/my_goals', to: 'goals#index_mine', as: :index_mine
  get '/users/:id/my_motivations', to: 'motivations#index_mine', as: :index_mine
  get '/users/:id/my_tactics', to: 'tactics#index_mine', as: :index_mine
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :characters, :goals, :motivations, :tactics, :prompts
end

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'static#homepage'
  get '/privacy', to: 'static#privacy'
  get '/users/:id/my_characters', to: 'characters#index_mine', as: :character_index_mine
  get '/users/:id/my_goals', to: 'goals#index_mine', as: :goal_index_mine
  get '/users/:id/my_motivations', to: 'motivations#index_mine', as: :motivation_index_mine
  get '/users/:id/my_tactics', to: 'tactics#index_mine', as: :tactic_index_mine
  resources :characters, :goals, :motivations, :tactics, :prompts
  resources :users do
    resources :prompts
  end
end

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'static#homepage'
  get '/privacy', as: 'privacy', to: 'static#privacy'
  resources :characters do
    resources :prompts
  end
  resources :goals, :tactics, :prompts
  resources :motivations, path: 'quests'
  resources :users do
    resources :prompts, only: [:index], to: 'prompts#index_mine'
    resources :characters, only: [:index], to: 'characters#index_mine'
    resources :goals, only: [:index], to: 'goals#index_mine'
    resources :motivations, only: [:index], to: 'motivations#index_mine'
    resources :tactics, only: [:index], to: 'tactics#index_mine'
  end
  get '/my_prompt_characters', as: 'my_prompt_characters', to: 'characters#index_mine_via_prompt'
  get '/my_prompt_quests', as: 'my_prompt_motivations', to: 'motivations#index_mine_via_prompt'
  get '/my_prompt_goals', as: 'my_prompt_goals', to: 'goals#index_mine_via_prompt'
  get '/my_prompt_tactics', as: 'my_prompt_tactics', to: 'tactics#index_mine_via_prompt'
end
Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'static#homepage'
  get '/privacy', to: 'static#privacy'
  resources :characters, :goals, :motivations, :tactics, :prompts
  resources :users do
    resources :prompts, only: [:index], to: 'prompts#index_mine'
    resources :characters, only: [:index], to: 'characters#index_mine'
    resources :goals, only: [:index], to: 'goals#index_mine'
    resources :motivations, only: [:index], to: 'motivations#index_mine'
    resources :tactics, only: [:index], to: 'tactics#index_mine'
  end
end

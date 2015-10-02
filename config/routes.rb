Rails.application.routes.draw do
  devise_for :users, only: :session, controllers: {sessions: 'users/sessions'}
  resources :games, only: [:index]
end

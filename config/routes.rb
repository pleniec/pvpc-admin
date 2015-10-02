Rails.application.routes.draw do
  devise_for :users, only: :session, controllers: {sessions: 'users/sessions'}
  resources :games, except: :show do
    resources :game_rules, except: :show
  end
end

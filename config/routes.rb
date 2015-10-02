Rails.application.routes.draw do
  devise_for :users, only: :session
end

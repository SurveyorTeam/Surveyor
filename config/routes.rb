Rails.application.routes.draw do
  resources :surveys
  
  resources :user_responses

  resources :studies

  devise_for :users
end


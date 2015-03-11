Rails.application.routes.draw do
  
  resources :survey_responses

  resources :responses

  resources :questions

  resources :projects

  resources :surveys
  
  resources :user_responses

  resources :studies

  devise_for :users
  
end


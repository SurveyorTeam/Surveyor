Rails.application.routes.draw do
  resources :studies

  devise_for :users
end


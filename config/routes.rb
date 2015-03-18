Rails.application.routes.draw do
  
  devise_for :subjects, controllers: {
    sessions:'subjects/sessions'
  }
  
  resources :subjects
  
  resources :survey_responses

  resources :responses

  resources :questions

  resources :projects

  resources :surveys 

  get 'surveys/survey_respond/:id' => 'surveys#survey_respond'
  
  resources :user_responses

  resources :studies

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
end


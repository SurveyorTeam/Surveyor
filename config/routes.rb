Rails.application.routes.draw do
  
  # survey specifics
  resources :demographics
  resources :responses
  resources :questions
  resources :projects 
  resources :surveys
  resources :user_responses
  resources :studies
  resources :survey_responses
  
  # users
  resources :subjects

  devise_for :subjects, controllers: {
    sessions:'subjects/sessions'
  }

  get '/submit_survey_responses' => 'surveys#submit_responses', as: :post
  
  get '/create_survey' => 'surveys#create_survey'

  get 'surveys/:id/survey_respond' => 'surveys#survey_respond'
  
  get 'projects/:id/survey/new' => 'surveys#new'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
end


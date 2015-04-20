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

  get '/submit_survey_responses' => 'surveys#submit_responses', as: :post
  get '/create_survey' => 'surveys#create_survey'
  get 'surveys/:id/survey_respond' => 'surveys#survey_respond'
  get 'projects/:id/survey/new' => 'surveys#new'

  devise_for :users, skip: [:registrations]
  devise_for :researchers
  devise_for :subjects

  namespace :researcher do
    root to: "projects#index"
  end

  namespace :subjects do
    root to: "surveys#index"
  end
end

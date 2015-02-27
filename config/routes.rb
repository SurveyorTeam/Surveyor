Rails.application.routes.draw do

  devise_for :surveys
  devise_for :projects
  devise_for :researchers
  get 'researchers/show' => 'researchers#show'

end


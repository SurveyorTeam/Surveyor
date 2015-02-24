Rails.application.routes.draw do

  devise_for :surveys
  devise_for :projects
  devise_for :researchers
end


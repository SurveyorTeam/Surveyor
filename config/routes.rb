Rails.application.routes.draw do
  # authenticated do
  #   root :to => 'researchers#home_page', as: :authenticated
  # end
  devise_for :research_subjects
  devise_for :surveys
  devise_for :projects
  devise_for :researchers
  #@David - the devise for stuff is pretty much meant for user authentication and the like, you can extend or orride their
  #stuff but they only have views and controllers for the authentication sorta stuff, so at that point
  #there is nothing to overwrite or extend for more general pages, so we might as well do the rest of our routes
  #and whatnot normally and leave devise in the backround doing the user auth stuff.
  get 'researchers/home_page' => 'researchers#home_page'

end


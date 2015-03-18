class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  #These have been moved to their respective controllers:sessions
  # def after_sign_in_path_for(subjects)
  #   '/subjects'
  # end
  
  
  # def after_sign_in_path_for(users)
  #   '/projects'
  # end
  
 
end

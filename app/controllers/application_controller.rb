class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  def signed_in 
    signed_in = (user_signed_in? || subject_signed_in?) ? true : false
    # retval = false
    # if (user_signed_in? || subject_signed_in)
    #   retval = true
    # end
    unless signed_in 
      head(404)
    end
  end
  def is_subject
    unless current_subject
      flash[:error] = "Subject only page"
      redirect_to home_path
    end
  end
  def is_researcher
    unless current_researcher
      flash[:error] = "Researcher only page"
      redirect_to home_path
    end
  end

  #These have been moved to their respective controllers:sessions
  # def after_sign_in_path_for(subjects)
  #   '/subjects'
  # end
  
  
  # def after_sign_in_path_for(users)
  #   '/projects'
  # end
  
 
end

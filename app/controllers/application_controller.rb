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

  def subject?
    unless current_subject
      flash[:error] = 'Sorry! this page is only for subjects.'
      redirect_to home_path
    end
  end

  def researcher?
    unless current_researcher
      flash[:error] = 'Sorry! this page is only for subjects.'
      redirect_to home_path
    end
  end
end

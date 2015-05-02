class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  def subject?
    if !current_subject
      flash[:error] = 'Sorry! this page is only for subjects.'
      redirect_to home_path
      false
    else
      true
    end
  end

  def researcher?
    if !current_researcher
      flash[:error] = 'Sorry! this page is only for researchers.'
      redirect_to home_path
      false
    else
      true
    end
  end

  def signed_in?
    if current_subject || current_researcher
      true
    else
      false
    end
  end
end

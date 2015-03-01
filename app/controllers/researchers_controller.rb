class ResearchersController < ApplicationController
  def home_page
    @current_user = current_researcher
    user_id = @current_user.id
    @user_projects = Project.where(:researcher_id => @current_user.id)
    @user_surveys = Array.new
    @user_projects.each do |p|
      surveys = Survey.where(:projects_id => p.id)
      surveys.each do |s|
        @user_surveys << s
      end
    end
  end
end

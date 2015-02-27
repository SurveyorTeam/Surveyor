class ResearchersController < ApplicationController
  
  def show
    @current_user = current_researcher
    puts "HERERERERE"
    puts @current_user.email
    puts @current_user.first_name
  end


end

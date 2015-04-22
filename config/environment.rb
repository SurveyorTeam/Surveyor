# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'thramp',
  :password => ')cbsTMcsJnwLztUPrkKFtucCVt3/xF/{A7Rj',
  :domain => 'surveyorapp.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

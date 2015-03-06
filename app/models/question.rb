class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :survey_responses
end

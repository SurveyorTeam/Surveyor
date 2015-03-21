class Question < ActiveRecord::Base

  def self.add_responses(responses,response_type)
    puts responses.class
    responses.each do |k,v|
      if response_type == 'text'
        Question.new(:text => v, :question_id => k)
      end #add bool, multi, etc
    end

  end
  belongs_to :survey
  has_many :survey_responses
end

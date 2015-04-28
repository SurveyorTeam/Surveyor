# class Survey_response < ActiveRecord::Base
# end
#holy crap this is so bad but it seems to need both to work and i have no idea why
class SurveyResponse < ActiveRecord::Base
    def self.add_responses_text(responses,response_type)
    puts responses.class
    puts '*************************'
    responses.each do |response|
      if response_type == 'text'
        response.each do |k,v|
          new_resp = SurveyResponse.create(text: v , question_id: k)
        end
      end #add bool, multi, etc
    end
  end
  belongs_to :question
end

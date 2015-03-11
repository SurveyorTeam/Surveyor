class Survey_response < ActiveRecord::Base
  belongs_to :question
end
#holy crap this is so bad but it seems to need both to work and i have no idea why
class SurveyResponse < ActiveRecord::Base
  belongs_to :question
end

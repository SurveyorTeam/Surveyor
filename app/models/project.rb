class Project < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  has_many :surveys

  def self.to_csv(options = {})
    CSV.generate(Hash.new) do |csv|
      csv << ['Project title', 'Survey Title', 'Question', 'Response']

      all.each do |project|
        surveys = Survey.where(projects_id: project.id)
        surveys.each do |survey|
          questions = Question.where(survey_id: survey.id)
          questions.each do |question|
            #question.type 0 is text, and 1 is T/F
            if question.kind == 0
              responses = SurveyResponse.where(question_id: question.id)
              responses.each do |response|
                d = [project.title, survey.name, question.text, response.text]
                csv << d
              end

            # made some changes below for True and False questions. We can't use response.bool
            # since that will give us an A or B (True or False) statement directly from the db.
            # instead, we'd rather have the actual question option (so if they wanted yes/no,
            # true/false, higher/lower, etc) response!
            else question.kind == 1          
              responses = SurveyResponse.where(question_id: question.id)
              responses.each do |response|
                if response.bool == "A"
                  d = [project.title, survey.name, question.text, question.boolean_option_1]
                  csv << d
                end
                if response.bool == "B"
                  d = [project.title, survey.name, question.text, question.boolean_option_2]
                  csv << d
                end
              end
            end


          end
        end
      end
    end
  end
end

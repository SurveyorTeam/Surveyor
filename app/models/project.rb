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
            responses = SurveyResponse.where(question_id: question.id)
            responses.each do |response|
              d = [project.title, survey.name, question.text, response.text]
              csv << d
            end
          end
        end
      end
    end
  end
end

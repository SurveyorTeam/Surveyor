class Project < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  has_many :surveys

  # def self.to_csv(options = {})
  # 	CSV.generate(options) do |csv|
  # 		csv << column_names
  # 		all.each do |project|
  # 			csv << project.attributes.values_at(*column_names)
  # 		end
  # 	end
  # end

  def self.to_csv(options = {})
  	CSV.generate(Hash.new) do |csv|
  		csv << ["Project title", "Survey Title", "Question", "Response"]

  		all.each do |project|
  			#surs = [Survey.where(:projects_id => project.id)]

  			surveys = Survey.where(:projects_id=> project.id)
  			surveys.each do |survey|
  				questions = Question.where(:survey_id => survey.id)
  				questions.each do |question|
  					responses = SurveyResponse.where(:question_id => question.id)
  					responses.each do |response|
	  					d = [project.title, survey.name, question.text, response.text]
	  					csv << d
	  				end
  				end

  			end

  			#thisworks#d = [project.title,Survey.where(:projects_id=> project.id).name]
  			#d = [project.title, Survey.find(project.qprojects_id).name]
  			#csv << d
  		end

  	end
  end

  # def self.to_csv(options = {})
  # 	CSV.generate(Hash.new) do |csv|
  # 		csv << ["Project title", "Survey Title", "Question", "Response"]
  # 		options = options.to_a
  # 		options.sort! {|a,b| a[1].updated_at <=> b[1].updated_at}
  # 		options.each_with_index do |value, index|
  # 			d = [index+1, value[1].title]
  # 			csv << d
  # 		end
  # 	end
  # end


end


# def self.to_csv(options = {}) 
# 	CSV.generate(Hash.new) do |csv| 
# 		col_names = ["#", "Title", "Album", "Artist", "Timestamp"] 
# 		csv << col_names 
# 		options = options.to_a 
# 		options.sort! { |a,b| a[1].updated_at <=> b[1].updated_at}
# 		options.each_with_index do |value, index| 
# 			d = [index+1, value[1].title, Album.find(value[1].album_id).name, Artist.find(value[1].artist_id).name, value[1].updated_at] 
# 			csv << d 
# 		end
# 	end
# end
require 'faker'
#require 'fabricator_helper.rb'

organizations = ['Brandeis','MIT','Scotland Yard','UMass','Berkley']
Fabricator(:user) do
	name{Faker::Name.first_name}
	email{Faker::Internet.email}
	password{Faker::Internet.password}
	#organization{organizations[rand(6)]}
end
Fabricator(:project) do
	title{Faker::Address.country}#studies names after countries, why not
	description{Faker::Company.bs}
	user_id{rand(15)+User.first.id}
end
Fabricator(:survey) do
	name{Faker::Lorem.word}
	projects_id{rand(50)+Project.first.id}
end


# Fabricator(:question) do
#   the_question=question_manipulator()
#   order{@order}
#   text{the_question[0]}
#   type{the_question[1]}
#   boolean_option_1{the_question[2]}
#   boolean_option_2{the_question[3]}
#   range_min{the_question[4]}
#   range_max{the_question[5]}
#   survey_id{@current_survey}
# end
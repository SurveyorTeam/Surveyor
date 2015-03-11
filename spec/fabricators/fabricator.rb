require 'faker'

organizations = ['Brandeis','MIT','Scotland Yard','UMass','Berkley']
Fabricator(:user) do
	name{Faker::Name.first_name}
	email{Faker::Internet.email}
	password{"password"}
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


Fabricator(:question) do
  order{rand(5)}
  text{Faker::Company.catch_phrase}
  kind{0}
  boolean_option_1{nil}
  boolean_option_2{nil}
  range_min{nil}
  range_max{nil}
  survey_id{rand(150)+Survey.first.id}
end

Fabricator(:survey_response) do
  bool{nil}
  range_num{nil}
  text{Faker::Lorem.sentence}
  question_id{rand(500)+Question.first.id}
end
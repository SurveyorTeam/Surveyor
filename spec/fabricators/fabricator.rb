require 'faker'
race = ['Black', 'White', 'Blue']
nationality = ['American', 'British', 'Portuguese']
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
  gender{rand(2)}
  age{rand(50)+18}
  education_level{rand(5)}
  race{race[rand(3)]}
  nationality{nationality[rand(3)]}
  state{Faker::Address.state}
end


Fabricator(:question) do
  order{rand(5)}
  text{Faker::Company.catch_phrase+"?"}
  kind{0}
  boolean_option_1{nil}
  boolean_option_2{nil}
  range_min{nil}
  range_max{nil}
  survey_id{rand(150)+Survey.first.id}
end

Fabricator(:SurveyResponse) do
  bool{nil}
  range_num{nil}
  text{Faker::Lorem.sentence}
  question_id{rand(500)+Question.first.id}
end

Fabricator(:subject) do
  email{Faker::Internet.email}
  name{Faker::Name.first_name}
  password{"password"}
  gender{rand(2)}
  age{rand(50)+18}
  education_level{rand(5)}
  race{race[rand(3)]}
  nationality{nationality[rand(3)]}
  state{Faker::Address.state}
end
require 'faker'
genders = ['male','female']
Fabricator(:researchee) do
	first_name{Faker::Name.first_name}
	last_name{Faker::Name.last_name}
	email{Faker::Internet.email}
	password{Faker::Internet.password}
	gender{genders[rand(2)]}
	age{10+rand(50)}
	education_level{1+rand(5)}
	state{Faker::Address.state}
	income{15000+rand(100000)}

end
organizations = ['Brandeis','MIT','Scotland Yard','UMass','Berkley']
Fabricator(:researcher) do
	first_name{Faker::Name.first_name}
	last_name{Faker::Name.last_name}
	email{Faker::Internet.email}
	password{Faker::Internet.password}
	organization{organizations[rand(6)]}
end

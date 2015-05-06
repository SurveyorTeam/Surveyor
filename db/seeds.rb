# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'fabrication'
User.destroy_all
Project.destroy_all
Survey.destroy_all
Question.destroy_all
SurveyResponse.destroy_all
Subject.destroy_all

1.times {Fabricate(:user)} 
#User.create( email: 'researcher@surveyor.com', encrypted_password: 'password',role: 0)
Project.create(title: '166b_class_opinions', description: 'Surveys to gather student feedback on a class', user_id: 1)

Survey.create(name: '166b_favorite_foods', gender: 'Any', education_level: 'Any', nationality: 'Any', projects_id: 1)
Question.create(text: 'Whats your favorite food?', kind: 0, survey_id: 1)
Question.create(text: 'What food do you like more', boolean_option_1: 'pickles',boolean_option_2: 'pumpkins', kind: 1, survey_id: 1)
Question.create(text: 'Would you kill for a klondike bar?', boolean_option_1: 'Obviously',boolean_option_2: 'no...', kind: 1, survey_id: 1)
Question.create(text: 'What is your favorite topping for a pizza?', kind: 0, survey_id: 1)

Survey.create(name: 'Grad opinions of 166b', gender: 'Any', education_level: 'Advanced', nationality: 'Any', projects_id: 1)
Question.create(text: 'What was your favorite part of the class?', kind: 0, survey_id: 2)
Question.create(text: 'How did it compare to other undergrad classes you have taken?', kind: 0, survey_id: 2)
Question.create(text: 'Would you take it again?', boolean_option_1: 'Yes',boolean_option_2: 'No', kind: 1, survey_id: 2)
SurveyResponse.create(text: 'Pine Cones',question_id: 1)
SurveyResponse.create(text: 'Walnuts',question_id: 1)
SurveyResponse.create(text: 'burgers',question_id: 1)
SurveyResponse.create(text: 'Leftovers',question_id: 1)
SurveyResponse.create(text: 'Floor change',question_id: 1)
SurveyResponse.create(text: 'Duck',question_id: 1)


33.times do SurveyResponse.create(bool: 'A',question_id: 3) end
45.times do SurveyResponse.create(bool: 'B',question_id: 3) end
50.times do SurveyResponse.create(bool: 'A',question_id: 7) end
1.times do SurveyResponse.create(bool: 'B',question_id: 7) end


Project.create(title: 'Brandeis Political Opinions', description:'A preliminary examination of undergraduate students opinions on the 2016 elections', user_id: 1)

Survey.create(name:'Democractic Leaning of Undergraduate Males', gender: 'Male', education_level:'Any', nationality:'USA', projects_id: 2)

#questions 8 - 14
Question.create(text:'Are you of voting age?', kind: 1, boolean_option_1: 'Yes', boolean_option_2:'No', survey_id: 3)
Question.create(text:'Have you previously voted for a democractic candidate?', kind: 1, boolean_option_1:'Yes', boolean_option_2:'No', survey_id: 3)
Question.create(text:'If the vote was today, which candidate would you vote for?', kind: 0, survey_id: 3)
Question.create(text:'What is the most important issue to you?', kind: 0, survey_id: 3)
Question.create(text:'Do you feel fully informed about the potential candidates?', kind: 1, boolean_option_1:'Yes', boolean_option_2:'No', survey_id: 3)
Question.create(text:'Would you be willing to donate to a candidate who only aligned on the previous issue?', kind:1, boolean_option_1: 'Yes', boolean_option_2: 'No',survey_id:3)
#8
13.times do SurveyResponse.create(bool: 'A', question_id: 8) end
7.times do SurveyResponse.create(bool: 'B', question_id: 8) end
#9
12.times do SurveyResponse.create(bool: 'A', question_id: 9) end
8.times do SurveyResponse.create(bool: 'B', question_id: 9) end
#10
8.times do SurveyResponse.create(text: 'Sanders', question_id: 10) end
7.times do SurveyResponse.create(text: 'Hillary', question_id: 10) end
5.times do SurveyResponse.create(text: 'Warren', question_id: 10) end
#11
4.times do SurveyResponse.create(text: 'Economy', question_id: 11) end
5.times do SurveyResponse.create(text: 'Education', question_id: 11) end
6.times do SurveyResponse.create(text: 'Immigration', question_id: 11) end
2.times do SurveyResponse.create(text: 'The children', question_id: 11) end
3.times do SurveyResponse.create(text: 'Abortion', question_id: 11) end
#12
6.times do SurveyResponse.create(bool: 'A', question_id: 12) end
14.times do SurveyResponse.create(bool: 'B', question_id: 12) end
#13
10.times do SurveyResponse.create(bool: 'A', question_id: 13) end
10.times do SurveyResponse.create(bool: 'B', question_id: 13) end

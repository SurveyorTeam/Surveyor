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
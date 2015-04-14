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

10.times do Fabricate(:subject) end
5.times do Fabricate(:user) end
15.times do Fabricate(:project) end
45.times do Fabricate(:survey) end
125.times do Fabricate(:question) end
300.times do Fabricate(:SurveyResponse) end

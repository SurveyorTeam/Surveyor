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

15.times do Fabricate(:user) end
50.times do Fabricate(:project) end
150.times do Fabricate(:survey) end
#500.times do Fabricate(:question) end 

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'fabrication'
Researchee.destroy_all
Researcher.destroy_all
100.times do Fabricate(:researchee) end
15.times do Fabricate(:researcher) end
# 100.times do 
 	#researchee = Researchee.create(first_name: Faker::Name.first_name,email:"email@email.com",password:"password",gender:"unicorn",age:"12",education_level:"3",state:"MA")
# end

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :studies, :foreign_key => "study_id"
  has_many :surveys, :foreign_key => "survey_id"
end

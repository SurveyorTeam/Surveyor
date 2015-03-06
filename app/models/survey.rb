class Survey < ActiveRecord::Base
  belongs_to :project
  has_many :questions
  validates :name, presence: true
end

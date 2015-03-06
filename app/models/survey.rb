class Survey < ActiveRecord::Base
  belongs_to :project
  has_many :questions
  validates :title, presence: true
end

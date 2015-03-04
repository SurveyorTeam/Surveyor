class Survey < ActiveRecord::Base
  belongs_to :study
  has_one :user, through: :study
  has_many :user_responses
  validates :title, presence: true
end

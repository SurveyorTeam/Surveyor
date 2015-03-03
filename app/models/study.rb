class Study < ActiveRecord::Base
  belongs_to :researcher
  validates :title, presence: true
end

class Demographic < ActiveRecord::Base
  belongs_to :subject
  enum education: [:no_high_school, :high_school, :associate, :bachelors, :masters, :advanced]
end

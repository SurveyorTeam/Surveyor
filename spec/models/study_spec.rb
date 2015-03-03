require 'rails_helper'

RSpec.describe Study, :type => :model do
  it "should have a valid factory" do
    FactoryGirl.build(:study).should be_valid
  end

  it "should require a title" do
    FactoryGirl.build(:study, :title => "").should_not be_valid
  end
end

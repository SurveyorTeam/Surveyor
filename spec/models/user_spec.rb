require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:projects) }
  it { should have_many(:surveys).through(:projects) }

  it "should have a valid factory" do
    user = FactoryGirl.build_stubbed(:user)
    expect(user).to be_valid
  end

  it "should require a email" do
    invalid_user = User.new(:email => "", :password => "password123")
    expect(invalid_user).to_not be_valid
  end

  it "should require a password" do
    invalid_user = User.new(:email => "user@gmail.com", :password => "")
    expect(invalid_user).to_not be_valid
  end
end

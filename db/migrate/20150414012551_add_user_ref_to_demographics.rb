class AddUserRefToDemographics < ActiveRecord::Migration
  def change
    add_reference :demographics, :user, index: true
    add_foreign_key :demographics, :users
  end
end

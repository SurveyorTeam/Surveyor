class AddUserIdToStudies < ActiveRecord::Migration
  def change
    add_reference :studies, :user, index: true
    add_foreign_key :studies, :users
  end
end

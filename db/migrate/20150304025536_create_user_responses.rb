class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
      t.string :response
      t.timestamps null: false

      #add_foreign_key :user_responses, :users
      #add_foreign_key :user_responses, :studies
      #add_foreign_key :user_responses, :surveys
      t.belongs_to :users, through: :studies, through: :surveys
      t.belongs_to :studies, through: :surveys
      t.belongs_to :surveys, index: true

    end
  end
end

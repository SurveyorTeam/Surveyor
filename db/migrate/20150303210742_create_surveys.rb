class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      #demographic info
      t.integer :gender
      t.integer :min_age
      t.integer :max_age
      t.integer :education_level
      t.string :nationality

      t.timestamps null: false
      t.belongs_to :projects
      #add_foreign_key :surveys, :studies
      #add_foreigh_key :surveys, :users
      #add_reference :surveys, :studies, index: true
    end
  end
end

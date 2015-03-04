class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :question

      t.timestamps null: false
      t.belongs_to :studies
      t.belongs_to :users
      #add_foreign_key :surveys, :studies
      #add_foreigh_key :surveys, :users
      #add_reference :surveys, :studies, index: true
    end
  end
end

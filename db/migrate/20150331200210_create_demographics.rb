class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.string :name
      t.integer :gender
      t.income :age
      t.integer :education
      t.string :nationality

      t.timestamps null: false
    end
  end
end

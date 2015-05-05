class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :education
      t.string :nationality
      t.integer :set_once

      t.timestamps null: false
    end
  end
end

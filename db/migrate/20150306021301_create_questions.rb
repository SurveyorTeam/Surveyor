class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :order
      t.string :text
      t.integer :kind
      t.string :boolean_option_1
      t.string :boolean_option_2
      t.integer :range_min
      t.integer :range_max

      t.belongs_to :survey
      t.timestamps null: false
    end
  end
end

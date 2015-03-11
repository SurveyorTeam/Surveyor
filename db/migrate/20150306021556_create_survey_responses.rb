class CreateSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_responses do |t|
      t.string :bool
      t.integer :range_num
      t.string :text

      t.belongs_to :question
      t.timestamps null: false
    end
  end
end

class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
      t.belongs_to :user
      #add_foreign_key :studies, :users
      #add_reference :studies, :user, index: true
    end
  end
end

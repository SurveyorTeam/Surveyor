class AddSubjectToDemographic < ActiveRecord::Migration
  def change
    add_reference :demographics, :subject, index: true
    add_foreign_key :demographics, :subjects
  end
end

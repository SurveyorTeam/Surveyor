class AddStudyIdToStudies < ActiveRecord::Migration
  def change
    add_reference :studies, :study, index: true
    add_foreign_key :studies, :studies
  end
end

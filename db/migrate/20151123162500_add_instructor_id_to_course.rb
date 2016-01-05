class AddInstructorIdToCourse < ActiveRecord::Migration
  def change
    add_foreign_key :courses, :instructors, column: :instructorid
  end
end

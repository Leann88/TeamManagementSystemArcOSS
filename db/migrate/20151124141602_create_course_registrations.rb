class CreateCourseRegistrations < ActiveRecord::Migration
  def change
    create_table :course_registrations do |t|

      t.integer :courseid
      t.integer  :studentid	
      t.timestamps null: false
    end
     add_foreign_key :course_registrations, :courses, column: :courseid
     add_foreign_key :course_registrations, :students, column: :studentid
  end
end

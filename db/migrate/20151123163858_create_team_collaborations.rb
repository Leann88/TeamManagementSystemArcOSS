class CreateTeamCollaborations < ActiveRecord::Migration
  def change
    create_table :team_collaborations do |t|

    	t.string :name
    	t.text :description
    	t.date :dueDate
    	t.date :teamFormationDeadline
    	t.integer :maximumNumStudents
    	t.integer :minimumNumStudents
    	t.integer :courseid
      t.timestamps null: false
    end
    add_foreign_key :team_collaborations, :courses, column: :courseid
  end
end

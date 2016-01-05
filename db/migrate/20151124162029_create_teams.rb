class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|

      t.string :name
      t.integer :liaisonid
      t.text :listOfMembers
      t.text :listOfCandidates
      t.integer :numOfStudents
      t.integer :teamcollaborationid
      t.timestamps null: false
    end

     add_foreign_key :teams, :team_collaborations, column: :teamcollaborationid
     add_foreign_key :teams, :students, column: :liaisonid
  end
end

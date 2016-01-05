class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :coursecode
      t.string :name
      t.string :description
      t.integer :instructorid

      t.timestamps null: false
    end

  end
end

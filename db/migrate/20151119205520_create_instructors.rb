class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :employeeid
      t.string :firstname
      t.string :lastname
      t.string :password
      t.string :email
      t.string :program

      t.timestamps null: false
    end
  end
end

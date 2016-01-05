class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :studentid
      t.string :password
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :program

      t.timestamps null: false
    end
  end
end

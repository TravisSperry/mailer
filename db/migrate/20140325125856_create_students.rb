class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :registration_id
      t.string :first_name
      t.string :last_name
      t.integer :grade
      t.string :email

      t.timestamps
    end
  end
end

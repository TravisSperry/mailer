class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.integer :registration_id
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :email
      t.string :volunteer

      t.timestamps
    end
  end
end

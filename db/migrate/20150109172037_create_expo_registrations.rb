class CreateExpoRegistrations < ActiveRecord::Migration
  def change
    create_table :expo_registrations do |t|
      t.string :name
      t.string :email
      t.integer :year
      t.boolean :newsletter

      t.timestamps
    end
  end
end

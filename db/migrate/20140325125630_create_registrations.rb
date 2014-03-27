class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :event_id
      t.string :school_name
      t.integer :student_count

      t.timestamps
    end
  end
end

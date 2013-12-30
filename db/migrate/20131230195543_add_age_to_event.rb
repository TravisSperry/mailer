class AddAgeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :age, :string
  end
end

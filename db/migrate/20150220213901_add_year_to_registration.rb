class AddYearToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :year, :integer, default: 0
  end
end

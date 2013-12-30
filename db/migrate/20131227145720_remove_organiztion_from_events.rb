class RemoveOrganiztionFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :organiztion
  end

  def down
    add_column :events, :organiztion, :string
  end
end

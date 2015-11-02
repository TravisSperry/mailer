class AddAttributesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :dates, :string
    add_column :events, :link, :string
  end
end

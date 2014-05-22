class AddEmailOptItToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :email_opt_in, :boolean, default: true
  end
end

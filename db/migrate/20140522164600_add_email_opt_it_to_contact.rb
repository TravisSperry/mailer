class AddEmailOptItToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :email_opt_in, :booelan, default: true
  end
end

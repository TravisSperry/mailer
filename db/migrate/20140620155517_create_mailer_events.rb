class CreateMailerEvents < ActiveRecord::Migration
  def change
    create_table :mailer_events do |t|
      t.string :name
      t.string :company
      t.string :date
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end

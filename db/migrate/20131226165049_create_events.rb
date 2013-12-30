class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :organiztion
      t.string :contact
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.text   :description
      t.string :cost

      t.timestamps
    end
  end
end

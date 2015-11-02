class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end

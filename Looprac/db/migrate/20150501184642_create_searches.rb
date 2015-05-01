class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :source_id
      t.integer :destination_id
      t.integer :seatnum
      t.float :price
      t.integer :gender
      t.boolean :ac
      t.boolean :food
      t.boolean :pets
      t.boolean :smoking
      t.boolean :music
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end

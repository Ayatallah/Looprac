class AddFieldsToRides < ActiveRecord::Migration
  def change
    add_column :rides, :date, :date
    add_column :rides, :time, :time
    add_column :rides, :reviewed, :boolean
    add_column :rides, :price, :float
    add_column :rides, :gender, :integer
    add_column :rides, :ac, :boolean
    add_column :rides, :food, :boolean
    add_column :rides, :pets, :boolean
    add_column :rides, :smoking, :boolean
    add_column :rides, :music, :boolean
  end
end

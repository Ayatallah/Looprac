class AddUserFields < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :age, :integer
  	add_column :users, :rank, :integer, :default => 1
  	add_column :users, :car_model, :string
  	add_column :users, :air_conditioned, :boolean, :default => false
  	add_column :users, :facebook, :string
  	add_column :users, :twitter, :string
  	add_column :users, :googleplus, :string
  end
end

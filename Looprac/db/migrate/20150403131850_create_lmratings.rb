class CreateLmratings < ActiveRecord::Migration
  def change
    create_table :lmratings do |t|
      t.integer :rating
      t.references :user
      t.references :landmark

      t.timestamps null: false
    end
  end
end

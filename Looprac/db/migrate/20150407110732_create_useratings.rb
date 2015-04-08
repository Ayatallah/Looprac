class CreateUseratings < ActiveRecord::Migration
  def change
    create_table :useratings do |t|
      t.integer :rating
      t.string :review
      t.integer :rated_id
      t.integer :rater_id

      t.timestamps null: false
    end

    add_index :useratings, [:rater_id, :rated_id], unique: true
  end
end

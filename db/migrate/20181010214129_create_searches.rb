class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.text :location
      t.integer :min_sq_ft
      t.integer :max_sq_ft
      t.integer :min_price
      t.integer :max_price
    end
  end
end

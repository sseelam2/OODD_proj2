class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.text :address
      t.string :company_id
      t.string :realtor_id
      t.string :sq_ft
      t.string :style
      t.integer :year
      t.binary :basement
      t.integer :floor

    end
  end
end

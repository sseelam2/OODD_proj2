class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_id
      t.string :name
      t.string :website
      t.text :address
      t.integer :size
      t.integer :founded
      t.integer :revenue
      t.text :synopsis

      t.timestamps
    end
  end
end

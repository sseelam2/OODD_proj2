class CreateRealtors < ActiveRecord::Migration[5.2]
  def change
    create_table :realtors do |t|
      t.text :email
      t.string :name
      t.text :password
      t.string :companyId
      t.integer :phoneNumber

      t.timestamps
    end
  end
end

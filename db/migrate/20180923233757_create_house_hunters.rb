class CreateHouseHunters < ActiveRecord::Migration[5.2]
  def change
    create_table :house_hunters do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :preferred_contact
      t.integer :phoneNumber

      t.timestamps
    end
  end
end

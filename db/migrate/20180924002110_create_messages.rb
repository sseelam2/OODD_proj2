class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :query
      t.string :house_hunter_id
      t.string :subject
      t.text :reply
      t.string :house_id

      t.timestamps
    end
  end
end

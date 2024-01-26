class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone, null: false
      t.integer :plus_ones_count, default: 0
      t.datetime :confirmed_at, null: true

      t.timestamps
    end

    add_index :guests, :phone, unique: true
  end
end

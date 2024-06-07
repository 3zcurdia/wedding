class AddCanceledAtToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :canceled_at, :datetime, null: true
  end
end

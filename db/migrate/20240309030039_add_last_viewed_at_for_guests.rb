class AddLastViewedAtForGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :last_viewed_at, :datetime, null: true
  end
end

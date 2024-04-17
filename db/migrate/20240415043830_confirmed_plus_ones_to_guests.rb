class ConfirmedPlusOnesToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :confirmed_plus_ones, :integer, default: 0
  end
end

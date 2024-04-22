class AllowNullPhoneOnGuests < ActiveRecord::Migration[7.1]
  def change
    change_column_null :guests, :phone, true
  end
end

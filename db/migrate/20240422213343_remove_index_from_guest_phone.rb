class RemoveIndexFromGuestPhone < ActiveRecord::Migration[7.1]
  def change
    remove_index :guests, :phone
  end
end

class AddCompanionReferenceToGuest < ActiveRecord::Migration[7.1]
  def change
    add_reference :guests, :companion, null: true, foreign_key: { to_table: :guests }
  end
end

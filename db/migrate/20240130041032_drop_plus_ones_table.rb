class DropPlusOnesTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :plus_ones
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

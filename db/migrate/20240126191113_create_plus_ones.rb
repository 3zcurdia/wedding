class CreatePlusOnes < ActiveRecord::Migration[7.1]
  def change
    create_table :plus_ones do |t|
      t.string :name, default: ""
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end

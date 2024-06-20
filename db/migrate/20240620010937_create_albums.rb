class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :albums, :slug, unique: true
  end
end

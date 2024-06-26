class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.references :record, polymorphic: true, null: false
      t.string :user_agent
      t.string :ip_address

      t.timestamps
    end
  end
end

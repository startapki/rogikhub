class CreateHubs < ActiveRecord::Migration
  def change
    create_table :hubs do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :hubs, :name, unique: true
  end
end

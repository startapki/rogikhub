class CreateHubs < ActiveRecord::Migration
  def change
    create_table :hubs do |t|
      t.string :name
      t.string :path, null: false

      t.timestamps null: false
    end

    add_index :hubs, :path, unique: true
  end
end

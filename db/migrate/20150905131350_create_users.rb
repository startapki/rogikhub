class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role, null: false, default: 0

      t.references :hub, index: true

      t.timestamps null: false
    end
  end
end

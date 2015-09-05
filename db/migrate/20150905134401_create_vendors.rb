class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.references :user, null: false, index: true
      t.references :hub, null: false, index: true

      t.timestamps null: false
    end
  end
end

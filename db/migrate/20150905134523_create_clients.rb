class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :user, null: false, index: true
      t.references :hub, null: false, index: true
      t.references :organization, null: false, index: true

      t.timestamps null: false
    end
  end
end

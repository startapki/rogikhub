class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :hub, null: false, index: true

      t.boolean :final, null: false, default: false

      t.string :name, null: false

      t.timestamps null: false
    end
  end
end

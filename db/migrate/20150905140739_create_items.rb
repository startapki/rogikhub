class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.integer :amount, null: false, default: 1
      t.string :comment

      t.references :order, null: false, index: true
      t.references :status

      t.timestamps null: false
    end
  end
end

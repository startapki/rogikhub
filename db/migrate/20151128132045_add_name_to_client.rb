class AddNameToClient < ActiveRecord::Migration
  def change
    change_table :clients do |t|
      t.string :name
    end
  end
end

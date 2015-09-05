class AddEmailHubUniqueIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, [:email, :hub_id], unique: true
  end
end

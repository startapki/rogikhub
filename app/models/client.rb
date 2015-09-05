class Client < ActiveRecord::Base
  belongs_to :user
  belongs_to :hub
  belongs_to :organization

  validates :user, :hub, :organizaion, presence: true
  validates :user_id, uniqueness: { scope: [:hub_id, :organization_id] }
end

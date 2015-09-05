class Vendor < ActiveRecord::Base
  belongs_to :user
  belongs_to :hub

  validates :user, :hub, presence: true
  validates :user_id, uniqueness: { scope: :hub_id }
end

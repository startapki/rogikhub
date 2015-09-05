class Client < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  validates :user, :organization, presence: true
  validates :user_id, uniqueness: { scope: [:organization_id] }
end

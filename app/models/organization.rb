class Organization < ActiveRecord::Base
  belongs_to :hub

  has_many :clients

  validates :name, presence: true
  validates :name, uniqueness: { scope: :hub_id }
end

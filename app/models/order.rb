class Order < ActiveRecord::Base
  belongs_to :client

  has_many :items, inverse_of: :order
  accepts_nested_attributes_for :items, allow_destroy: true

  validates :client, presence: true

  scope :for_organization, lambda { |organization|
    where(organizations: { id: organization.id }) if organization.present?
  }
end

class Order < ActiveRecord::Base
  belongs_to :client

  has_many :items, inverse_of: :order
  accepts_nested_attributes_for :items, allow_destroy: true

  validates :client, presence: true
  validate :items_precence

  scope :for_organization, lambda { |organization|
    where(organizations: { id: organization.id }) if organization.present?
  }

  private

  def items_precence
    errors.add(:base, I18n.t('order.order_must_contain_items')) if items.blank?
  end
end

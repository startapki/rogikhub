class Client < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  has_many :orders

  validates :user, :organization, presence: true
  validates :user_id, uniqueness: {
    scope: :organization_id,
    message: I18n.t('errors.already_client')
  }

  validate :user_is_not_vendor

  accepts_nested_attributes_for :user

  private

  def user_is_not_vendor
    return unless organization.hub.vendors.where(user: user).exists?

    errors.add(:user_id, I18n.t('errors.already_vendor'))
  end
end

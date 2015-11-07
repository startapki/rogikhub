class Client < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  has_many :orders

  validates :user, :organization, presence: true
  validates :user_id, uniqueness: {
    scope: [:organization_id],
    message: I18n.t('errors.already_client')
  }

  accepts_nested_attributes_for :user
end

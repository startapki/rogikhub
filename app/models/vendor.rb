class Vendor < ActiveRecord::Base
  belongs_to :user
  belongs_to :hub

  validates :user, :hub, presence: true
  validates :user_id, uniqueness: {
    scope: :hub_id,
    message: I18n.t('errors.already_vendor')
  }

  validate :user_is_not_client

  private

  def user_is_not_client
    return unless hub.clients.where(user: user).exists?

    errors.add(:user_id, I18n.t('errors.already_client'))
  end
end

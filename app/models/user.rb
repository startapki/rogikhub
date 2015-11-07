class User < ActiveRecord::Base
  devise :database_authenticatable, :invitable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :clients
  has_many :vendors

  validates :name, presence: true

  def vendor?
    vendors.any?
  end
end

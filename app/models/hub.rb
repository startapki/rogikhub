class Hub < ActiveRecord::Base
  has_many :vendors, dependent: :restrict_with_exception
  has_many :organizations, dependent: :restrict_with_exception

  has_many :clients, through: :organizations
  has_many :orders, through: :clients

  validates :name, :path, presence: true
  validates :path, uniqueness: true

  def self.new_for(user)
    new vendors: [user.vendors.build]
  end

  def to_param
    path
  end
end

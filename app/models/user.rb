class User < ActiveRecord::Base
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :clients
  has_many :vendors
end

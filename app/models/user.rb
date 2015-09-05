class User < ActiveRecord::Base
  devise :database_authenticatable, :invitable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :clients
  has_many :vendors
end

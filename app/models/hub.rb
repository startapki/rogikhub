class Hub < ActiveRecord::Base
  validates :name, :path, presence: true
  validates :path, uniqueness: true

  has_many :vendors, dependent: :restrict_with_exception
  has_many :clients, dependent: :restrict_with_exception
end

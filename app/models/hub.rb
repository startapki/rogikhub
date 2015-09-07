class Hub < ActiveRecord::Base
  has_many :vendors, dependent: :restrict_with_exception
  has_many :organizations, dependent: :restrict_with_exception

  has_many :clients, through: :organizations

  validates :name, :path, presence: true
  validates :path, uniqueness: true

  def to_param
    path
  end
end

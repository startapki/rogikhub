class Hub < ActiveRecord::Base
  has_many :vendors, dependent: :restrict_with_exception
  has_many :organizations, dependent: :restrict_with_exception

  has_many :clients, through: :organizations
  has_many :orders, through: :clients
  has_many :statuses

  validates :name, :path, presence: true
  validates :path, uniqueness: true

  after_commit :create_statuses, on: :create

  def self.new_for(user)
    new vendors: [user.vendors.build]
  end

  def to_param
    path
  end

  private

  def create_statuses
    ['Принят', 'На сборке'].each do |status_name|
      statuses.create! name: status_name, final: false
    end
    statuses.create! name: 'Отгружен', final: true
    statuses.create! name: 'Отсутствует', final: true
  end
end

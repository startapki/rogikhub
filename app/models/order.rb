class Order < ActiveRecord::Base
  belongs_to :client

  has_many :items

  validates :client, presence: true
end

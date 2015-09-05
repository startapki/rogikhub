class Order < ActiveRecord::Base
  belongs_to :client

  has_many :items, inverse_of: :order

  validates :client, presence: true
end

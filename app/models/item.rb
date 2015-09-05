class Item < ActiveRecord::Base
  belongs_to :order, inverse_of: :items
  belongs_to :status

  has_many :items

  validates :name, :order, presence: true
end

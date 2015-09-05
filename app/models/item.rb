class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :status

  has_many :items

  validates :title, :order, presence: true
end

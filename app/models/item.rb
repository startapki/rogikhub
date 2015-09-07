class Item < ActiveRecord::Base
  belongs_to :order, inverse_of: :items
  belongs_to :status

  validates :name, :order, presence: true
end

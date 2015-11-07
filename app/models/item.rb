class Item < ActiveRecord::Base
  belongs_to :order, inverse_of: :items
  belongs_to :status

  validates :name, :order, :amount, presence: true

  def status_name
    status.nil? ? 'New' : status.name
  end
end

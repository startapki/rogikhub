class Status < ActiveRecord::Base
  belongs_to :hub

  has_many :items

  validates :hub, :name, :final, presence: true
end

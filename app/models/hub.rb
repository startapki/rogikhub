class Hub < ActiveRecord::Base
  validates :name, :path, presence: true
  validates :path, uniqueness: true
end

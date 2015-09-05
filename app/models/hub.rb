class Hub < ActiveRecord::Base
  validates :name, :path, presence: true
  valudates :path, uniqueness: true
end

class Hub < ActiveRecord::Base
  validates :name, :path, presence: true
  validates :path, uniqueness: true

  before_create :generate_path, if: :path?

  def generate_path
    self.path = name.to_s.parameterize
    return unless Hub.where(path: path).exists?
    i = 1
    i += 1 while Hub.where(path: "#{path}-#{i}").exists?
    self.path += "-#{i}"
  end
end

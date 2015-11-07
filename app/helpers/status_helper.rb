module StatusHelper
  def statuses_with_default
    [
      Status.new(name: 'New'),
      current_hub.statuses.where(final: false),
      current_hub.statuses.where(final: true)
    ].flatten
  end
end

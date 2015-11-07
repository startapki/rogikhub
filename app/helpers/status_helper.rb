module StatusHelper
  def statuses_with_default
    [
      Status.new(name: 'Новый'),
      current_hub.statuses.where(final: false),
      current_hub.statuses.where(final: true)
    ].flatten
  end
end

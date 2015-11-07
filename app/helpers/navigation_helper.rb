module NavigationHelper
  def nav_item(controller, &block)
    klass = 'active' if params[:controller] == controller
    content_tag(:li, class: klass) do
      yield block
    end
  end
end

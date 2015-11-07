module ApplicationHelper
  def actions_for(item, options = {})
    wrapper_options = options.merge(
      class: "actions btn-group group #{options[:class]}"
    )

    content_tag(:div, wrapper_options) do
      concat edit_button_for(item)
      concat destroy_button_for(item)
    end
  end

  def container_class
    if content_for?(:container_class)
      content_for(:container_class)
    else
      'container'
    end
  end

  def container_class=(klass)
    content_for(:container_class) { klass }
  end

  private

  def edit_button_for(item)
    link_to(
      '', edit_polymorphic_path(item),
      class: 'btn btn-default btn-xs glyphicon glyphicon-pencil'
    )
  end

  def destroy_button_for(item)
    link_to(
      '', item,
      method: :delete,
      class: 'btn btn-danger btn-xs glyphicon glyphicon-remove',
      data: { confirm: t('question.are_you_sure') }
    )
  end
end

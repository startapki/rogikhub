module ApplicationHelper
  def actions_for(item, *actions)
    options = actions.extract_options!
    actions = [:edit, :destroy] if actions.blank?

    wrapper_options = options.merge(
      class: "actions btn-group group #{options[:class]}"
    )

    content_tag(:div, wrapper_options) do
      concat edit_button_for(item) if actions.include?(:edit)

      concat destroy_button_for(item) if actions.include?(:destroy)
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
    concrete_item = item.try(:last) || item
    options = { class: 'btn btn-default btn-xs glyphicon glyphicon-pencil' }
    path = edit_polymorphic_path(item)

    link_to('', path, options) if policy(concrete_item).edit?
  end

  def destroy_button_for(item)
    concrete_item = item.try(:last) || item
    options = {
      method: :delete,
      class: 'btn btn-danger btn-xs glyphicon glyphicon-remove',
      data: { confirm: t('question.are_you_sure') }
    }

    link_to('', item, options) if policy(concrete_item).destroy?
  end
end

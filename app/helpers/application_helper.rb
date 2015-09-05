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

  private

  def edit_button_for(item)
    item_name = item.class.to_s.underscore

    link_to(
      '', send(:"edit_#{item_name}_path", item),
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

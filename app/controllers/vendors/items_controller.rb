module Vendors
  class ItemsController < HubScopedController
    def update
      item = load_item
      authorize item
      item.update item_params
      redirect_to vendors_orders_path(current_hub)
    end

    private

    def item_params
      params.require(:item).permit(:status_id)
    end

    def load_item
      Item.joins(order: { client: { organization: :hub } })
          .where(hubs: { id: current_hub.id })
          .find(params[:id])
    end
  end
end

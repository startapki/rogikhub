module Vendors
  class OrdersController < HubScopedController
    def index
      @organizations = current_hub.organizations

      @organization = @organizations.find_by(id: params[:organization_id])

      @orders = current_hub.orders
                           .for_organization(@organization)
                           .order(created_at: :desc)
    end
  end
end

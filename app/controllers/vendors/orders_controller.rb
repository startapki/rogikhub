module Vendors
  class OrdersController < HubScopedController
    def index
      @organizations = current_hub.organizations

      @organization = @organizations.find_by(id: params[:organization_id])
    end
  end
end

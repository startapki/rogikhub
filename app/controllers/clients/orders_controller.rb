module Clients
  class OrdersController < HubScopedController
    before_action :set_order, only: [:edit, :update, :destroy]

    def index
      @orders = Order.joins(:client)
                     .includes(:items)
                     .where('clients.organization_id = ?',
                            current_organization.id)
                     .order(updated_at: :desc)
    end

    def new
      @order = current_client.orders.build
      authorize @order
    end

    def edit
    end

    def create
      @order = Order.new(order_params)
      authorize @order

      if @order.save
        redirect_to clients_orders_url, notice: t('model.order.created')
      else
        render :new
      end
    end

    def update
      if @order.update(order_params)
        redirect_to clients_orders_url, notice: t('model.order.updated')
      else
        render :edit
      end
    end

    def destroy
      @order.destroy

      redirect_to clients_orders_url, notice: t('model.order.destroyed')
    end

    private

    def set_order
      @order = Order.find(params[:id])
      authorize @order
    end

    def order_params
      params
        .require(:order)
        .permit(items_attributes: [:id, :name, :amount, :comment, :_destroy])
        .merge(client: current_client)
    end
  end
end

class OrdersController < HubScopedController
  before_action :set_order, only: [:edit, :update, :destroy]

  def index
    @orders = Order.joins(:client)
                   .includes(:items)
                   .where(clients: { organization_id: current_organization.id })
                   .order(updated_at: :desc)
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_url, notice: t('model.created')
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to orders_url, notice: t('model.updated')
    else
      render :edit
    end
  end

  def destroy
    @order.destroy

    redirect_to orders_url, notice: t('model.destroyed')
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params
      .require(:order)
      .permit(items_attributes: [:id, :name, :amount, :comment, :_destroy])
      .merge(client: current_client)
  end
end

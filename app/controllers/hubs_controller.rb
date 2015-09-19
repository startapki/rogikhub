class HubsController < ApplicationController
  def index
    return unless current_user.present?

    @vendors = current_user.vendors.includes(:hub)
    @clients = current_user.clients.includes(organization: :hub)
  end

  def new
    @hub = Hub.new
  end

  def create
    @hub = Hub.new hub_params
    if @hub.save
      redirect_to organizations_path(@hub), notice: t('model.hub.created')
    else
      render :new
    end
  end

  private

  def hub_params
    params.require(:hub).permit(:name, :path)
  end
end

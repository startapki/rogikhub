class HubsController < ApplicationController
  after_action :verify_authorized, except: :index

  def index
    return unless current_user.present?

    @vendors = current_user.vendors.includes(:hub)
    @clients = current_user.clients.includes(organization: :hub)
  end

  def new
    @hub = Hub.new_for current_user

    authorize @hub
  end

  def create
    @hub = Hub.new_for(current_user)
    @hub.assign_attributes hub_params

    authorize @hub

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

  def current_hub
    current_user.vendors.first.try(:hub) ||
      current_user.clients.first.try(:organization).try(:hub)
  end
end

class ClientsController < HubScopedController
  before_action :load_organization

  def new
    @client = @organization.clients.build user: User.new
  end

  def create
    user = User.invite! user_params
    if user.persisted?
      user.clients.create organization: @organization
      redirect_to organizations_path(current_hub), notice: t('model.created')
    else
      render :new
    end
  end

  private

  def load_organization
    @organization = current_hub.organizations.find(params[:organization_id])
  end

  def user_params
    params[:client].require(:user_attributes).permit(:email, :name)
  end

  def client_params
    params.require(:client)
  end
end

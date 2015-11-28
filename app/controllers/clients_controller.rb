class ClientsController < HubScopedController
  before_action :set_organization
  before_action :set_client, only: [:edit, :update, :destroy]

  def new
    @client = @organization.clients.build user: User.new

    authorize @client
  end

  def create
    @client = @organization.clients.build client_params

    authorize @client

    if @client.save
      send_invite @client

      redirect_to organizations_path(current_hub),
                  notice: t('model.created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @client.update(edit_client_params)
      redirect_to organizations_path(current_hub),
                  notice: t('model.updated')
    else
      render :edit
    end
  end

  def destroy
    @client.destroy

    redirect_to organizations_path(current_hub),
                notice: t('model.destroyed')
  end

  private

  def set_organization
    @organization = current_hub.organizations.find(params[:organization_id])
  end

  def set_client
    @client = @organization.clients.find(params[:id])
    authorize @client
  end

  def send_invite(client)
    client.user.invite!(current_user) unless client.user.invitation_accepted?
  end

  def client_params
    user = User.find_by(email: params[:client][:user_attributes][:email])

    if user.present?
      params.require(:client).permit(:name).merge(user_id: user.id)
    else
      new_client_params
    end
  end

  def new_client_params
    params
      .require(:client)
      .permit(:name, user_attributes: [:email])
      .deep_merge!(user_attributes: { password: Devise.friendly_token[0, 20],
                                      confirmed_at: Time.zone.now })
  end

  def edit_client_params
    params.require(:client).permit(:name)
  end
end

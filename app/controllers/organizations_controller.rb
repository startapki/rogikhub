class OrganizationsController < HubScopedController
  def index
    @organizations = current_hub.organizations.includes(clients: :user)
  end

  def new
    @organization = current_hub.organizations.build
    authorize @organization
  end

  def create
    @organization = current_hub.organizations.build organization_params
    authorize @organization

    if @organization.save
      redirect_to organizations_path(current_hub),
                  notice: t('model.organization.created')
    else
      render :new
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end
end

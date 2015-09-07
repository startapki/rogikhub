class OrganizationsController < HubScopedController
  def index
    @organizations = current_hub.organizations
  end

  def new
    @organization = current_hub.organizations.build
  end

  def create
    @organization = current_hub.organizations.build organization_params
    if @organization.save
      redirect_to organizations_path(current_hub), notice: t('model.created')
    else
      render :new
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end
end

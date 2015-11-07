class OrganizationsController < HubScopedController
  before_action :set_organization, only: [:edit, :update, :destroy]

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

  def edit
    authorize @organization
  end

  def update
    authorize @organization

    if @organization.update(organization_params)
      redirect_to organizations_path(current_hub),
                  notice: t('model.organization.created')
    else
      render :edit
    end
  end

  def destroy
    authorize @organization

    @organization.destroy

    redirect_to organizations_path(current_hub),
                notice: t('model.organization.destroyed')
  end

  private

  def set_organization
    @organization = current_hub.organizations.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end
end

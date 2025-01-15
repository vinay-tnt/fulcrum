module V1
  class TenantsController < BaseController
    def index
      tenants = Tenant.all
      render json: V1::TenantBlueprint.render_as_hash(tenants)
    end

    def show
      tenant = Tenant.find(params[:id])
      render json: V1::TenantBlueprint.render_as_hash(tenant)
    end
  end
end

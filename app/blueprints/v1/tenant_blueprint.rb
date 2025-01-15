module V1
  class TenantBlueprint < Blueprinter::Base
    identifier :id

    fields :name, :subdomain, :status, :email, :website, :description, :address, :created_at, :updated_at
  end
end

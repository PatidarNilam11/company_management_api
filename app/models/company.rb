class Company < ApplicationRecord
  belongs_to :user
  after_create :create_tenant

  private
  def create_tenant
    Apartment::Tenant.create(subdomain)
  end
end

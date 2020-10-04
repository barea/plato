class OrgnaizationTenant < Tenant
  belongs_to :organization, required: true
end

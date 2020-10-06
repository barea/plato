class OrgnaizationTenant < User
  belongs_to :organization, required: true
end

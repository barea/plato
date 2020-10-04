json.extract! tenant, :id, :user_id, :organization_id, :type, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)

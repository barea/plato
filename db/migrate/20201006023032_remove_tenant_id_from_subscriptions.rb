class RemoveTenantIdFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :tenant_id, :integer
  end
end

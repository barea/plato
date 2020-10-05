class AddTenantToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :tenant_id, :integer
  end
end

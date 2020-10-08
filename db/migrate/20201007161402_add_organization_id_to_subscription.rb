class AddOrganizationIdToSubscription < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :organization_id, :integer
  end
end

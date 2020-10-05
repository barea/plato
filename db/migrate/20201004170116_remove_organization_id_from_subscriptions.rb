class RemoveOrganizationIdFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :organization_id, :integer
  end
end

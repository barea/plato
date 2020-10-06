class RemoveSubscriptionIdFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :subscription_id, :integer
  end
end

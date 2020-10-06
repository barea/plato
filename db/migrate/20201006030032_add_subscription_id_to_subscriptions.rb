class AddSubscriptionIdToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :subscription_id, :integer
  end
end

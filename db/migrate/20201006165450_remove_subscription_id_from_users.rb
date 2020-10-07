class RemoveSubscriptionIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :subscription_id, :ineger
  end
end

class AddSubscriptionIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :subscription_id, :integer
  end
end

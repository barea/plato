class AddStatusToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :status, :string
  end
end

class RemoveStatusFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :status, :string
  end
end

class RemoveActiveFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :active, :boolean
  end
end

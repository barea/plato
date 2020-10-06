class AddIsOrgToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_org, :boolean
  end
end

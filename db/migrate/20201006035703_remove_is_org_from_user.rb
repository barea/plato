class RemoveIsOrgFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :is_org, :boolean
  end
end

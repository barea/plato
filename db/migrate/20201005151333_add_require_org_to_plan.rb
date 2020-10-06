class AddRequireOrgToPlan < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :require_org, :boolean
  end
end

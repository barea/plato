class DropTenant < ActiveRecord::Migration[6.0]
  def change
    drop_table :tenants
  end
end

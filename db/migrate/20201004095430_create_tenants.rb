class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.integer :user_id
      t.integer :organization_id
      t.string :type

      t.timestamps
    end
  end
end

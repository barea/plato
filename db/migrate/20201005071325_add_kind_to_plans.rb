class AddKindToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :kind, :string
  end
end

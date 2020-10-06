class RemoveKindFromPlan < ActiveRecord::Migration[6.0]
  def change
    remove_column :plans, :kind, :string
  end
end

class RenameStatusToCompleted < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :status, :completed
  end
end

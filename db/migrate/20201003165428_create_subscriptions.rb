class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :organization_id
      t.integer :plan_id
      t.string :status
      t.string :frequancey
      t.integer :num_of_board
      t.integer :num_of_seat

      t.timestamps
    end
  end
end

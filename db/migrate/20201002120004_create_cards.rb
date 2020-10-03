class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :board_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :text
      t.integer :card_id
      t.boolean :status

      t.timestamps
    end
  end
end

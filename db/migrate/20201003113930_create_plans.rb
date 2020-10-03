class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.boolean :active
      t.integer :licence_seats_num
      t.integer :licence_boards_num
      t.float :monthly_licence_price
      t.float :annual_licence_price
      t.float :monthly_seat_price
      t.float :monthly_board_price

      t.timestamps
    end
  end
end

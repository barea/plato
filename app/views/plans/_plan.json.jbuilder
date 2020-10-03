json.extract! plan, :id, :name, :active, :licence_seats_num, :licence_boards_num, :monthly_licence_price, :annual_licence_price, :monthly_seat_price, :monthly_board_price, :created_at, :updated_at
json.url plan_url(plan, format: :json)

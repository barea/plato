desc "Insert required plato plans"

task :insert_plans => :environment do
  Plan.where(name: "Solo", require_org: false, active: true, licence_seats_num: 1, licence_boards_num: nil, monthly_licence_price: 2.00, annual_licence_price: nil, monthly_seat_price: nil, monthly_board_price: 2.00).first_or_create!
  Plan.where(name: "Startup", require_org: true, active: true, licence_seats_num: 5, licence_boards_num: nil, monthly_licence_price: 20.00, annual_licence_price: 18.00, monthly_seat_price: 7.00, monthly_board_price: nil).first_or_create!
  Plan.where(name: "Enterprise", require_org: true, active: true, licence_seats_num: 20, licence_boards_num: nil, monthly_licence_price: 60.00, annual_licence_price: 55.00, monthly_seat_price: 6.00, monthly_board_price: nil).first_or_create!

end

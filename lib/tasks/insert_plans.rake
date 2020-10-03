desc "Insert required plato plans"

task :insert_plans => :environment do
  Plan.where(name: "solo", active: true, licence_seats_num: "", licence_boards_num: "1", monthly_licence_price: "2.00", annual_licence_price: "", monthly_seat_price: "", monthly_board_price: "2.00").first_or_create
  Plan.where(name: "Startup", active: true, licence_seats_num: "5", licence_boards_num: "-1", monthly_licence_price: "20.00", annual_licence_price: "18.00", monthly_seat_price: "7.00", monthly_board_price: "").first_or_create
  Plan.where(name: "Enterprise", active: true, licence_seats_num: "20", licence_boards_num: "-1", monthly_licence_price: "60.00", annual_licence_price: "55.00", monthly_seat_price: "6.00", monthly_board_price: "").first_or_create

end

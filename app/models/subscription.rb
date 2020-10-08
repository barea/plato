class Subscription < ApplicationRecord


  FREQUENCY = %w(Monthly Annually)
  STATUS = %w(active expire cancelled)

  validates :frequancey, :inclusion => {:in => FREQUENCY}
  validates :status, :inclusion => {:in => STATUS}

  belongs_to :plan
  belongs_to :user
  belongs_to :organization, optional: true

  validates_presence_of :plan_id
  validates_presence_of :frequancey
  validates_presence_of :status

  attribute :num_of_board, :integer, default: 0
  attribute :num_of_seat, :integer, default: 0

  def current_bill_fees

    case frequancey
    when 'Monthly'
      plan.monthly_licence_price + addon_cost

    when 'Annually'
      plan.annual_licence_price + addon_cost
    end

  end

  def addon_cost
    (plan.monthly_seat_price * (num_of_seat-plan.licence_seats_num).non_negative) + (plan.monthly_board_price * (num_of_board-plan.licence_boards_num).non_negative)
  end

end

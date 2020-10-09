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
    # calculate the extra seats (number of users) added to the subscription.
    # This is the numbr of addtional users addedd on top of the allowed number for the purchsed licence
    # if no extra users then the value will be zero (call non_negative to convert negative value to zero)
    extra_seats = (num_of_seat - plan.licence_seats_num).non_negative
    # calculate the extra boards (number of users) added to the subscription.
    # This is the numbr of addtional boards addedd on top of the allowed number for the purchsed licence
    # if no extra boards then the value will be zero (call non_negative to convert negative value to zero)
    extra_boards = (num_of_board - plan.licence_boards_num).non_negative
    # if the plan allow unlimited number of boards or seats then the price has to be entred as zero so it doesn't count in the bill
    (plan.monthly_seat_price * extra_seats) + (plan.monthly_board_price * extra_boards)
  end

end

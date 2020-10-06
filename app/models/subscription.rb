class Subscription < ApplicationRecord

  belongs_to :plan
  belongs_to :user

  validates_presence_of :plan_id
  validates_presence_of :frequancey
  validates_presence_of :status

  FREQUENCY = %w(Monthly Annually)

  validates :frequancey, :inclusion => {:in => FREQUENCY}


  STATUS = %w(active expire cancelled)

  validates :status, :inclusion => {:in => STATUS}

end

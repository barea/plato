class Subscription < ApplicationRecord

  belongs_to :plan
  belongs_to :user, optional: true
  belongs_to :organization, optional: true

  validates_presence_of :plan_id
  validates_presence_of :frequancey

end

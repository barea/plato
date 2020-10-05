class Subscription < ApplicationRecord

  belongs_to :plan
  belongs_to :user, optional: true
  belongs_to :organization, optional: true
  belongs_to :tenant

  validates_presence_of :plan_id
  validates_presence_of :frequancey
  validates_presence_of :active
end

class Tenant < ApplicationRecord
  belongs_to :user, required: true
  has_one :subscriptions
  # validate :user_is_tenant
  validates_presence_of :user_id

  def user_is_tenant
    errors.add(:user,"already a Tenant") if User.where(id: self.user_id).last.tenant.present?
  end

end

class Tenant < ApplicationRecord
  belongs_to :user, required: true
  validate :user_is_tenant

  def user_is_tenant
    errors.add(:user,"already a Tenant") if self.user.tenant.present?
  end

end

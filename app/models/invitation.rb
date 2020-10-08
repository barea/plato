require 'securerandom'
class Invitation < ApplicationRecord
  before_save :generate_code
  belongs_to :organization

  validates_presence_of :invited_by_user_id, :organization_id

  def generate_code
    self.code = SecureRandom.base64(6) unless self.code
    self.expire_at = 24.hours.from_now unless self.expire_at
  end

  def self.validate_code(code)
    where(code: code, used_by_user_id: nil).where("expire_at >= ?", Time.now).last
  end

end

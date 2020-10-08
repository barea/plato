class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :boards
  has_many :cards
  has_one :subscription
  belongs_to :organization, optional: true

  def individual?
    type == 'IndividualTenant'
  end

  def organization?
    type == 'OrgnaizationTenant'
  end
  #select all * from subscription wher(user.id =)
  def active?
    Subscription.where(user_id: id).last.present? || organization_id.present?
  end

  def manage_subscription?
    subscription.present?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.name = data["name"] if user.name.blank?
      end
    end
  end

end

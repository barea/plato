class Organization < ApplicationRecord
  has_many :boards
  has_many :users
  has_one :subscription
  has_many :orgnaization_tenants

  validates_presence_of :name

end

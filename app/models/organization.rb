class Organization < ApplicationRecord
  has_many :boards
  has_many :users
  has_one :subscription
  has_many :invitation

  validates_presence_of :name

end

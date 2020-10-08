class Organization < ApplicationRecord
  has_many :boards
  has_many :users
  has_one :subscription

  validates_presence_of :name

end

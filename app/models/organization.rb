class Organization < ApplicationRecord
  has_many :boards
  has_many :users
  has_one :subscription, optional: true

  validates_presence_of :name

end

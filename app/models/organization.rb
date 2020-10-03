class Organization < ApplicationRecord
  has_many :boards
  has_many :users

  validates_presence_of :name

end

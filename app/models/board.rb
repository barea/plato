class Board < ApplicationRecord
  has_many :cards
  belongs_to :organization, optional: true
  belongs_to :user

  validates_presence_of :name
end

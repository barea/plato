class Card < ApplicationRecord
  belongs_to :board
  has_many :tasks

  validates_presence_of :name
  validates_presence_of :board_id
  validates_presence_of :user_id
end

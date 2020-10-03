class Task < ApplicationRecord
  belongs_to :card

  validates_presence_of :text
  validates_presence_of :card_id
end

class Plan < ApplicationRecord

  has_many :subscriptions

  validates_presence_of :name
  validates_presence_of :active, default: true
end

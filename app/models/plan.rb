class Plan < ApplicationRecord

  has_many :subscriptions

  validates_presence_of :name
  validates_presence_of :active, :default => true
  validates_presence_of :monthly_licence_price
end

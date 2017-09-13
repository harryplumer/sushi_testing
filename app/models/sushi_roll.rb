class SushiRoll < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :price, :spicy

  # Instance Methods
  def is_too_expensive?
    price > 20 ? true : false
  end

  # Class Methods
  def self.only_spicy
    where("spicy = true")
  end

  def self.not_spicy
    where("spicy = false")
  end

  def self.by_price
    order(:price)
  end
end

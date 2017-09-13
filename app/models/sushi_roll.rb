class SushiRoll < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :price

  # Instance Methods
  def is_too_expensive?
    price > 20 ? true : false
  end

  # Class Methods
  def self.only_spicy
    where("spicy = true")
  end

  def self.only_mild
    where("spicy = false")
  end

  def self.by_price
    order(:price)
  end
end

class Province < ApplicationRecord
  has_many :customers
  has_many :addresses

  validates :name, presence: true
  validates :abbreviation, presence: true, length: { is: 2 }
  validates :gst_rate, :pst_rate, :hst_rate, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
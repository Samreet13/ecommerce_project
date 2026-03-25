class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  has_many :order_items

  validates :status, presence: true, inclusion: { in: %w[new paid shipped] }
  validates :subtotal, :tax_total, :grand_total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.statuses
    %w[new paid shipped]
  end
end
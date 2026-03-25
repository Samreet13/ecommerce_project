class Product < ApplicationRecord
  has_many :order_items
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :sale_price, numericality: { greater_than: 0 }, allow_nil: true

  scope :on_sale, -> { where(on_sale: true) }
  scope :new_arrivals, -> { where("created_at >= ?", 3.days.ago) }
  scope :recently_updated, -> { where("updated_at >= ?", 3.days.ago) }
end
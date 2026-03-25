class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :province
  has_many :orders

  validates :street, :city, :postal_code, presence: true
  validates :postal_code, format: { with: /\A[A-Z]\d[A-Z]\s?\d[A-Z]\d\z/i, message: "must be a valid Canadian postal code" }
end
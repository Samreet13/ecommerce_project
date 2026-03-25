class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  belongs_to :province, optional: true
  has_many :addresses
  has_many :orders

  validates :first_name, :last_name, presence: true
  validates :phone, format: { with: /\A[\d\s\-\+\(\)]+\z/ }, allow_blank: true
end
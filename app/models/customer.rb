class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :province, optional: true
  has_many :addresses
  has_many :orders

  validates :first_name, :last_name, presence: true
end
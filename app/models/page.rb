class Page < ApplicationRecord
  validates :slug, presence: true, uniqueness: true, inclusion: { in: %w[about contact] }
  validates :title, :body, presence: true
end
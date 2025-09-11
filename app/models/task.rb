class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, presence: true
  # validates :description, presence: true

  scope :created_today, -> { where(created_at: Date.current.all_day) }
end

class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user

  # validates :title, presence: true
  # validates :description, presence: true

  scope :for_today, -> { where(due_date: Date.current) }
end

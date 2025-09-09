class Task < ApplicationRecord
  belongs_to :users
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true

  scope :for_today, -> { where(due_date: Date.current) }
end

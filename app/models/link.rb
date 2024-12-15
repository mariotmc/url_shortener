class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  scope :recent_first, -> { order(created_at: :desc) }
end

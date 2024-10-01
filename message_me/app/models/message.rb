class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  scope :show_20, -> { order(:created_at).last(20) }
end

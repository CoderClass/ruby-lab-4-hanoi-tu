class Message < ApplicationRecord
  validates :username, presence: true
  validates :content, presence: true

  belongs_to :room
end


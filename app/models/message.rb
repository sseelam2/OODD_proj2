class Message < ApplicationRecord

  validates :subject, presence: true
  validates :house_id, presence: true
  validates :query, presence: true
end

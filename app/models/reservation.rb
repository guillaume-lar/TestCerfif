class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  # validate :user_id, :flat_id
  validates :date, presence: true
end

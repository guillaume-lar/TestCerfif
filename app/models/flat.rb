class Flat < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :image
  # validate :address, :price, :size, :room
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :flats, :reservations
  has_many :flats
  has_many :reservations

  # validate :first_name, :last_name, :email, :phone_number, :address, presence: true
  # validate :email, :phone_number, uniqueness: true
end

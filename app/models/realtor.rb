class Realtor < ApplicationRecord

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :phoneNumber, presence: true, length: {is: 10}, numericality: {only_integer: true }
  validates :password, presence: true, length: {minimum: 8}
  has_one :company
  has_many :houses
end

class HouseHunter < ApplicationRecord

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, length: {minimum: 8}
  validates :preferred_contact, presence: true

end

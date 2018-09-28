class Realtor < ApplicationRecord

  validates :email, uniqueness: true
  has_one :company
end

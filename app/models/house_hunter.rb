class HouseHunter < ApplicationRecord

  validates :email, uniqueness: true

end

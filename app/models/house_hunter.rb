class HouseHunter < ApplicationRecord

  has_many :queries
  LIST=['Select','Mobile','Email','None']

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false }


  validates :name, presence: true
  validates :phone, presence: true, length: {maximum: 10}
end

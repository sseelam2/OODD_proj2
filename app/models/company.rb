class Company < ApplicationRecord

  belongs_to :realtor
  has_many :realtors
end

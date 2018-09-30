class Company < ApplicationRecord

  validates :company_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :website, presence: true
  validates :address, presence: true
  belongs_to :realtor
  has_many :realtors
end

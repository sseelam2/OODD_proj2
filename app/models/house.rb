class House < ApplicationRecord

  validates :address, presence: true
  validates :company_id, presence: true, numericality: {only_integer: true}
  validates :realtor_id, presence: true, numericality: {only_integer: true}
  validates :sq_ft, presence: true, numericality: {only_integer: true}
  validates :style, presence: true
  validates :year, presence: true, numericality: {only_integer: true}
  validates :basement, presence: true
  validates :floor, presence: true, numericality: {only_integer: true}
  belongs_to :realtor


end

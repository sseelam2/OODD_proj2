class Search < ApplicationRecord
  def search_houses
    houses=House.all

    #houses= houses.where(location: category) if category.present?
    houses=House.where(["address LIKE ?",location]) if location.present?
    houses=House.where(["sq_ft >= ?",min_sq_ft]) if min_sq_ft.present?
    houses=House.where(["sq_ft <= ?",max_sq_ft]) if max_sq_ft.present?
    houses=House.where(["rent >= ?",min_price]) if min_price.present?
    houses=House.where(["rent <= ?",max_price]) if max_price.present?

    return houses
    end

end

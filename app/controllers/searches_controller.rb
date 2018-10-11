class SearchesController < ApplicationController

  protect_from_forgery with: :null_session

  def new
    #@search=House.where(["location LIKE ?","%#{params[:search]}%"])
    @search=Search.new
    #@locations=House.uniq.pluck(:location)
  end

  def create
    @search=Search.create(search_params)
    redirect_to @search
  end

  def show
    @search= Search.find(params[:id])
  end

  private

  def search_params
    params.permit(:searches).permit(:location, :min_sq_ft, :max_sq_ft, :min_price, :max_price)
  end

end

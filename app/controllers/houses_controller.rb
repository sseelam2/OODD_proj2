class HousesController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  def index
    @houses= House.all
  end
  def new
    @house = House.new()
  end
  def create
    puts "Houses add ----------------------------"


    @house = House.new(house_params)
    if @house.save
      flash[:noticeAddHouse] = "Signup Successful, Please Login"
      redirect_to  :action => 'index'
    else
      puts "-------------"
      flash[:alert_signup] = "Signup Failed, Please Retry!"
      redirect_to  :action => 'new'
    end
  end

  def show

  end
  def edit

  end

  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end

  private
  def set_post

    @house = House.find(params[:id])
  end

  def house_params
    # same as using "params[:realtor]", except that it:
    # - raises an error if :realtor is not present
    # - allows listed attributes to be mass-assigned
    params.require(:house).permit(:address, :company_id, :realtor_id, :sq_ft, :style, :year,:basement,:floor)
  end


end

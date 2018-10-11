class HouseHuntersController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  def index
    @house_hunters= HouseHunter.all
  end
  def new
    @house_hunter = HouseHunter.new()
  end
  def create
    puts "House Hunter  add ----------------------------"


    @house_hunter = HouseHunter.new(househunter_params)
    if @house_hunter.save
      flash[:noticeAddHH] = "Signup Successful, Please Login"
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
      if @house_hunter.update(househunter_params)
        format.html { redirect_to @house_hunter, notice: 'House Hunter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @house_hunter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @house_hunter.destroy
    respond_to do |format|
      format.html { redirect_to house_hunters_url }
      format.json { head :no_content }
    end
  end

  private
  def set_post

    @house_hunter = HouseHunter.find(params[:id])
  end

  def househunter_params
    # same as using "params[:realtor]", except that it:
    # - raises an error if :realtor is not present
    # - allows listed attributes to be mass-assigned
    params.require(:house_hunter).permit(:name, :phoneNumber, :email, :password, :preferred_contact)
  end

end



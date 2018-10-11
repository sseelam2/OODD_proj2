class RealtorsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  def index
    @realtors= Realtor.all
  end
  def new
    @realtor = Realtor.new()
  end
  def create
    puts "Realtor add ----------------------------"


    @realtor = Realtor.new(realtor_params)
    if @realtor.save
      flash[:noticeAddRealtor] = "Signup Successful, Please Login"
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
      if @realtor.update(realtor_params)
        format.html { redirect_to @realtor, notice: 'Realtor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @realtor.destroy
    respond_to do |format|
      format.html { redirect_to realtors_url }
      format.json { head :no_content }
    end
  end

  private
  def set_post

    @realtor = Realtor.find(params[:id])
  end

  def realtor_params
    # same as using "params[:realtor]", except that it:
    # - raises an error if :realtor is not present
    # - allows listed attributes to be mass-assigned
    params.require(:realtor).permit(:name, :phoneNumber, :email, :password, :companyId)
  end


  end



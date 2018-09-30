class SignupController < ApplicationController

  def show
  end


  def new
    @realtor = Realtor.new()
    @house_hunter = HouseHunter.new()
    @companies = Company.all
    puts "newwwwwwww"
  end


  def edit

  end


  def create


    if(params[:role] == "Realtor")
        puts "----------" +params[:role]

    @realtor = Realtor.new(realtor_params)
    if @realtor.save
      flash[:notice] = "Signup Successful, Please Login"
      redirect_to :controller => 'signin', :action => 'index'
    else
      flash[:alert_signup] = "Signup Failed, Please Retry!"
      render ('new')
    end

    else
      @house_hunter = HouseHunter.new(hunter_params)
      if @house_hunter.save
        flash[:notice] = "Signup Successful, Please Login"
        redirect_to :controller => 'signin', :action => 'index'
      else
        flash[:alert_signup] = "Signup Failed, Please Retry!"
        render ('new')
      end
    end



  end


  def update

  end


  def destroy

  end




  private

  def realtor_params
    # same as using "params[:realtor]", except that it:
    # - raises an error if :realtor is not present
    # - allows listed attributes to be mass-assigned
    params.require(:realtor).permit(:name, :phoneNumber, :email, :password, :companyId)
  end
  def hunter_params
    # same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    params.require(:house_hunter).permit(:name, :phoneNumber, :email, :password, :preferred_contact)
  end

end

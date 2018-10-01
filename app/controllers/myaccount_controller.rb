class MyaccountController < ApplicationController
  before_action :set_post, only: [:edit, :update]
  def index
    puts "in edit"
    if(session[:role] == "admin")
      @admin = Admin.find(session[:user_id])
      puts "Im Myaccount"  + @admin.email
    elsif(session[:role] == "realtor")
      @realtor = Realtor.find(session[:user_id])
    elsif(session[:role] == "hunter")
          @house_hunter = HouseHunter.find(session[:user_id])
    end
    puts session[:user_id]
    puts session[:role]

  end
  def show
    puts "show"
    if(session[:role] == "admin")
      @admin = Admin.find(session[:user_id])
      puts "Im Myaccount"  + @admin.email
    elsif(session[:role] == "realtor")
      @realtor = Realtor.find(session[:user_id])
    elsif(session[:role] == "hunter")
      @house_hunter = HouseHunter.find(session[:user_id])
    end

  end
  def edit

  end
  def update
    puts "entered update"
    if(session[:role] == "admin")

        if @admin.update(admin_params)
          redirect_to :action => 'index'
          flash[:noticeadu] = 'Admin was successfully updated.'


        else
          flash[:errorup] = :unprocessable_entity

        end

    elsif(session[:role] == "realtor")


        if @realtor.update(admin_params)
          redirect_to :action => 'index'
          flash[:noticeadu] = 'Admin was successfully updated.'


        else
          flash[:errorup] = :unprocessable_entity

        end

    elsif(session[:role] == "hunter")


        if @house_hunter.update(admin_params)
          redirect_to :action => 'index'
          flash[:noticeadu] = 'Admin was successfully updated.'


        else
          flash[:errorup] = :unprocessable_entity

        end

    end

  end




  private
  def set_post
    if(session[:role] == "admin")
      @admin = Admin.find(session[:user_id])
      puts "Im Myaccount"  + @admin.email
    elsif(session[:role] == "realtor")
      @realtor = Realtor.find(session[:user_id])
    elsif(session[:role] == "hunter")
      @house_hunter = HouseHunter.find(session[:user_id])
    end

  end
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
  def admin_params
    # same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    params.require(:admin).permit(:name, :email)
  end
end

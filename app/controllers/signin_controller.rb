class SigninController < ApplicationController
  def index
    flash[:alert] =""
  end

  def show
  end

def validate

  @signin = Signinform.new(params[:signinform][:email],params[:signinform][:password])

  if(HouseHunter.find_by_email(@signin.email))
    @hunter=HouseHunter.find_by_email(@signin.email);
    if(@signin.password == @hunter.password)
      puts "success"
      session[:user_id] = @hunter.id
      session[:role] = "hunter"
      redirect_to :controller => 'myaccount', :action => 'index'
    else

      flash[:alert] = "Please check the password!"
      render ('index')
    end
    puts @hunter.name
  elsif(Realtor.find_by_email(@signin.email))
       @realtor=Realtor.find_by_email(@signin.email)
       if(@signin.password == @realtor.password)
         puts "success"
         session[:user_id] = @realtor.id
         session[:role] = "realtor"
         redirect_to :controller => 'myaccount', :action => 'index'
       else

         flash[:alert] = "Please check the password!"
         render ('index')
       end

  else

      flash[:alert] = "Please check the email entered!"
      render ('index')
  end
  end

  def new

  end


  def edit
  end


  def create


  end


  def update

  end


  def destroy

  end



end

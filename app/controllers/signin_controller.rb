class SigninController < ApplicationController
  def index
    flash[:alert] =""
  end

  def show
  end

def validate

  @signin = Signinform.new(params[:signinform][:email],params[:signinform][:password])
  puts "------------------------------------"

  if(HouseHunter.find_by_email(@signin.email))
    @hunter=HouseHunter.find_by_email(@signin.email);
    if(@signin.password == @hunter.password)
      puts "success"
      redirect_to :controller => 'myaccount', :action => 'index', :param1 => @signin.email
    else

      flash[:alert] = "Please check the password!"
      render ('index')
    end
    puts @hunter.name
  elsif(Realtor.find_by_email(@signin.email))
       @realtor=Realtor.find_by_email(@signin.email)
       if(@signin.password == @realtor.password)
         puts "success"
         redirect_to :controller => 'myaccount', :action => 'index', :param1 => @signin.email
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

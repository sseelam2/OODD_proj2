class SigninController < ApplicationController
  def index
  end

  def show
  end

def validate
  puts "validating" +params[:signinform][:email]
  @signin = Signinform.new(params[:signinform][:email],params[:signinform][:password])
  puts "------------------------------------"

  if(HouseHunter.find_by_email(@signin.email))
    @hunter=HouseHunter.find_by_email(@signin.email);
    if(@signin.password == @hunter.password)
      puts "success"
      redirect_to :controller => 'myaccount', :action => 'index', :param1 => @signin.email
    end
    puts @hunter.name
  else if(Realtor.find_by_email(@signin.email))
       @realtor=Realtor.find_by_email(@signin.email)
       if(@signin.password == @realtor.password)
         puts "success"
         redirect_to :controller => 'myaccount', :action => 'index', :param1 => @signin.email
       end
       puts realtor.name
  end

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

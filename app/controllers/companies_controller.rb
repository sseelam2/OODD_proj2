class CompaniesController < ApplicationController
  def index
  end
  def new
    @company = Company.new()
  end
  def create
 puts "companies add ----------------------------"


 @company = Company.new(company_params)
 if @company.save
   flash[:noticeAddCompany] = "Signup Successful, Please Login"
   redirect_to :controller => 'myaccount', :action => 'companies'
 else
   puts "-------------"
   flash[:alert_signup] = "Signup Failed, Please Retry!"
   redirect_to  :action => 'new'
 end
  end


  private

  def company_params
    # same as using "params[:realtor]", except that it:
    # - raises an error if :realtor is not present
    # - allows listed attributes to be mass-assigned
    params.require(:company).permit(:company_id, :name, :website, :address, :size, :founded,:revenue,:synopsis)
  end

end

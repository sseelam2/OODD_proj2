class CompaniesController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  def index
    @companies= Company.all
    puts "------------***********"
    puts session[:user_id]
    if(session[:role] == "realtor")
      @realtor_company=Realtor.find(session[:user_id]).companyId
      puts @realtor_company
    end

  end
  def new
    @company = Company.new()
  end
  def create
 puts "companies add ----------------------------"


 @company = Company.new(company_params)
 if @company.save
   flash[:noticeAddCompany] = "Signup Successful, Please Login"
   if(session[:role] == "realtor")
    @realtor=Realtor.find(session[:user_id])
     @realtor.companyId=@company.company_id
    if @realtor.save
      puts  "new id"
      @realtor_company=Realtor.find(session[:user_id]).companyId
      puts  @realtor_company
    end
   end
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
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  private
  def set_post

      @company = Company.find(params[:id])
  end

  def company_params
    # same as using "params[:realtor]", except that it:
    # - raises an error if :realtor is not present
    # - allows listed attributes to be mass-assigned
    params.require(:company).permit(:company_id, :name, :website, :address, :size, :founded,:revenue,:synopsis)
  end

end

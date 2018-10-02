class MessagesController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :set_post1, only: [:new]
  def index
    if(session[:role] == "admin")
      @messages= Message.all
      unless @messages
        @messages=[]
        end
    elsif(session[:role] == "realtor")
      @company_id=Realtor.find(session[:user_id]).companyId
      @messages= Message.where( companyId: @company_id)
      unless @messages
        @messages=[]
      end

    elsif(session[:role] == "hunter")
      @messages= Message.where(house_hunter_id: session[:user_id].to_s)
      puts @messages
      unless @messages
        @messages=[]
      end
    end

  end
  def new
    @message = Message.new()
    puts "********************"
    puts session[:comp_id]
  end
  def create
    puts "Messages add ----------------------------"


    @message = Message.new(message_params)
    @message.companyId=session[:comp_id]
    if @message.save
      flash[:noticeAddMessage] = "Signup Successful, Please Login"
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
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
  def set_post

    @message = Message.find(params[:id])
  end
  def set_post1

    @message = Message.new()
  end
  def message_params
    # same as using "params[:realtor]", except that it:
    # - raises an error if :realtor is not present
    # - allows listed attributes to be mass-assigned
    params.require(:message).permit(:query, :house_hunter_id, :subject, :reply, :house_id,:companyId)
  end

end

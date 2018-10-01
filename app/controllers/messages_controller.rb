class MessagesController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  def index
    @messages= Message.all
  end
  def new
    @message = Message.new()
  end
  def create
    puts "Messages add ----------------------------"


    @message = Message.new(message_params)
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

  def message_params
    # same as using "params[:realtor]", except that it:
    # - raises an error if :realtor is not present
    # - allows listed attributes to be mass-assigned
    params.require(:message).permit(:query, :house_hunter_id, :subject, :reply, :house_id)
  end

end

class MyaccountController < ApplicationController
  def index
    puts "in edit"
    puts params[:param1]
  end
end

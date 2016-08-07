class MyBooksController < ApplicationController
  skip_before_filter :verify_authenticity_token


  def create
    p "##############"
    p session[:current_user_id]
    p "$$$$$$$$$$$$$$"
    p params[:bookish_id]
    @my_book = MyBook.new(user_id: session[:current_user_id], bookish_id: params[:bookish_id])
    @my_book.save
    if logged_in?
      redirect_to bookishes_path
    else
      redirect_to login_path
    end
  end


end

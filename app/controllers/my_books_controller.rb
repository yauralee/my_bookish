class MyBooksController < ApplicationController
  skip_before_filter :verify_authenticity_token


  def create
    if logged_in?
      @my_book = MyBook.new(user_id: session[:current_user_id], bookish_id: params[:bookish_id])
      @my_book.save!
      redirect_to bookishes_path
    else
      redirect_to login_path
    end
  end

  def index
    if logged_in?
      @my_books = MyBook.where(user_id: session[:current_user_id]).paginate(:page => params[:page]).order('id DESC')
      @bookishes_in_my_books = []
      @my_books.each do |my_book|
        @bookishes_in_my_books.push(Bookish.find(my_book.bookish_id))
      end
      @bookishes_in_my_books
    else
      redirect_to login_path
    end
  end


end

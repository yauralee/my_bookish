class MyBooksController < ApplicationController
  require 'will_paginate/array'
  skip_before_filter :verify_authenticity_token

  layout "bookish"

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
      @my_books = MyBook.where(user_id: session[:current_user_id]).order('id DESC').paginate(:page => params[:page])
      @bookishes_in_my_books = []
      @my_books.each do |my_book|
        @bookishes_in_my_books.push(Bookish.find(my_book.bookish_id))
      end
      @bookishes_in_my_books
      @bookishes_in_my_books = @bookishes_in_my_books.select{ |item|
         /\A.*#{params[:keywords]}.*\z/ =~ item.title
      }.paginate(:page => params[:page]) if params[:keywords].present?
    else
      redirect_to login_path
    end
  end

  def destroy
    if logged_in?
      @my_book = MyBook.find(params[:id])
      @my_book.destroy
      redirect_to my_books_path
    else
      redirect_to login_path
    end
  end
end

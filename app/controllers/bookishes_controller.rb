class BookishesController < ApplicationController
  layout "bookish"
  def index
    @bookishes = Bookish.paginate(:page => params[:page])
  end

  def show
    @bookish = Bookish.find(params[:id])
  end
end

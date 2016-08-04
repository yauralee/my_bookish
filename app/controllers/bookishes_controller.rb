class BookishesController < ApplicationController
  def index
    # @bookishes = Bookish.all
    @bookishes = Bookish.paginate(:page => params[:page])

  end

  def show
    @bookish = Bookish.find(params[:id])
  end
end

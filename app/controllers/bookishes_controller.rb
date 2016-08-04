class BookishesController < ApplicationController
  def index
    @bookishes = Bookish.all
  end

  def show
    @bookish = Bookish.find(params[:id])
  end
end

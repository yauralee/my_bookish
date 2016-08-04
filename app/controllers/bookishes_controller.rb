class BookishesController < ApplicationController
  def index
    bookishes = Bookish.all
    render json: bookishes
  end
end

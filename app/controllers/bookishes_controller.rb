class BookishesController < ApplicationController
  def index
    @bookishes = Bookish.all
  end
end

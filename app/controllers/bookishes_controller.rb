class BookishesController < ApplicationController
  layout "bookish"
  def index
    (logged_in?) ? (@bookishes = Bookish.paginate(:page => params[:page])) : (redirect_to login_path)
  end

  def show
    @bookish = Bookish.find(params[:id])
  end
end

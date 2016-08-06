class BookishesController < ApplicationController
  layout "bookish"
  def index
    (session.present?) ? (@bookishes = Bookish.paginate(:page => params[:page])) : (redirect_to signup_path)
  end

  def show
    @bookish = Bookish.find(params[:id])
  end
end

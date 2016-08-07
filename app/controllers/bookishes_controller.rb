class BookishesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :check_log_in

  layout "bookish"

  def index
    @bookishes = Bookish.paginate(:page => params[:page]).order('id DESC')
  end

  def show
    @bookish = Bookish.find(params[:id])
  end

  def check_log_in
    unless logged_in?
      redirect_to login_path
    end
  end
end

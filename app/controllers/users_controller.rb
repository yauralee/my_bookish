class UsersController < ApplicationController
  def new
    @user = User.new(params[:user])
  end

  def create
    @user = User.new(user_params)
    @user.password = (user_params[:password].blank? ? nil : Digest::SHA256.hexdigest(user_params[:password]))
    if @user.save
      redirect_to bookishes_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit!().except(:created_at, :updated_at)
  end
end

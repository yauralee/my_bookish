class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
  end

  def create
    authorized_user = User.authenticate(params[:session][:email], params[:session][:password])
    if authorized_user
      log_in(authorized_user)
      redirect_to bookishes_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to :action => 'login'
  end

end

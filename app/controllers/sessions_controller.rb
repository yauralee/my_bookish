class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
  end

  def create

    if params[:session][:email].blank? || params[:session][:password].blank?
      flash.now[:login_info_blank] = 'email or password can\'t be blank'
      render 'new'
    else
      authorized_user = User.authenticate(params[:session][:email], params[:session][:password])
      if authorized_user
        log_in(authorized_user)
        redirect_to bookishes_path
      else
        flash.now[:invalid_input] = 'Invalid email/password combination'
        render 'new'
      end
    end


  end

  def destroy
    session[:current_user_id] = nil
    redirect_to login_path
  end

end

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      user.logged_in = true
      user.save
      redirect_to new_game_path
    else
      @error_msg = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    current_user.logged_in = false
    current_user.save
    log_out
    redirect_to root_url
  end
end

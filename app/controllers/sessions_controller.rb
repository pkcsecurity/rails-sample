class SessionsController < ApplicationController
  def index
    @user = User.new
  end

  def verify
    @user = User.new(user_params)
    user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])

    if user
      #do good stuff
      redirect_to 'http://www.success.com/'
    else
      redirect_to 'http://www.failed.com/'
      #render 'index'
    end
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end

class WelcomeController < ApplicationController

  def home
  end

  def signin
    @user = User.new
    @users = User.all
  end
  
  def signout
    session.delete(:user_id)
    redirect_to root_path
  end
  
  def create
    @user = User.find_by(params.require(:user).permit(:id))
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

end

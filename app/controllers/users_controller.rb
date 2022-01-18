class UsersController < ApplicationController

  skip_before_action :require_sign_in!, only: [:new, :create]


 def new
    @user = User.new
 end

 def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
 end

 def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = '退会が完了しました。'
      redirect_to :root
 end


  private

 def user_params
      params.require(:user).permit(:name, :mail, :password, :password_confirmation)
 end

 def set_user
     @user = User.find_by(:id => params[:id])
 end

end

class SessionsController < ApplicationController

skip_before_action :login_required

 def new
 end

def create
##送信されたメールアドレスを使って、データベースからユーザーを取り出しています##
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login_path
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
end

def log_in(user)
    session[:user_id] = user.id
end

def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
end

end

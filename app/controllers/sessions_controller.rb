class SessionsController < ApplicationController
  def new
  end
  # user = User.find_by(email: params[:session][:email])
  # フォームから送信されたメールアドレスを取得し、一致するユーザーがいるか検索しています。
  # if user && user.authenticate(params[:session][:password])
  # 「該当のメールアドレスをもつUserが存在している。かつUserのパスワードが正しい。」場合のみtrueになる条件式
  # successがkeyで、ログインに成功しましたがvalueになる。↓application.html.erb
  # 忘れたら、bootstrap4で検索して左のsearchで
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to calendars_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
# log_inメソッドでsession[:user_id]にログイン情報を保存しています。
# Railsに事前定義されているsession.deleteメソッドで、Sessionを削除

 # user = User.find_by(email_params)
     # if user && user.authenticate(password_params[:password])
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end

# current_userは、現在ログインしているUserを返すメソッド
# logged_inは、ログインしているかどうか確認するためのメソッド
# application_controllerはControllerで共通で使用するコードを指定
# application_helperなどのhelperはViewで使用する共通のコードを指定します。
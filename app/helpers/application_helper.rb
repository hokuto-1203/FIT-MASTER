module ApplicationHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end
end

# application_helperなどのhelperはViewで使用する共通のコードを指定します
# current_userは、現在ログインしているUserを返すメソッド
# logged_inは、ログインしているかどうか確認するためのメソッド

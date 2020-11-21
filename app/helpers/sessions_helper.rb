module SessionsHelper
    def current_user
        if session[:user9527].present?
            @login_user ||= User.find_by(email: session[:user9527])
        else
            nil
        end
    end
end

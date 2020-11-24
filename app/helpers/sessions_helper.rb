module SessionsHelper
    def current_user
        if session[:user9527].present?
            # @login_user ||= User.find_by(email: session[:user9527])
            @_user9487 ||= User.find_by(id: session[:user9527])
        else
            nil
        end
    end

    def user_sign_in?
        if current_user
            return true
        else
            return false
        end
    end

end

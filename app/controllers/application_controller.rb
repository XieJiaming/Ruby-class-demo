class ApplicationController < ActionController::Base
    include SessionsHelper

    before_action :session_required, only: [:edit, :update]

    rescue_from(ActiveRecord::RecordNotFound, {with: :record_not_found})
    private
    def session_required
        redirect_to sign_in_users_path, notice: '請先登入會員' if not user_sign_in?
    end
    
    def record_not_found
        # redirect_to root_path, notice: "GO"
        render file: 'public/404.html', 
               layout: false, 
               status: :not_found
        # render file: 'public/404.html', 
        #        layout: false, 
        #        status: :404

    end 
end

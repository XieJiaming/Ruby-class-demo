class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        u = User.login(params[:user])
        if  u.save
            #發號碼牌
            session[:user9527] = u.id
            # session[:user9527] = params[:user][:email]
            redirect_to root_path, notice: '登入成功'
        else
            redirect_to session_path, notice: '登入失敗'
        end
    end

    def destroy
        session[:user9527] = nil
        redirect_to root_path, notice: '已登出'
    end

end

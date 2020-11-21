class SessionsController < ApplicationController
    def new
    end

    def create
        if  User.login(params[:user])
            #發號碼牌
            session[:user9527] = params[:user][:email]
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

class BoardsController < ApplicationController
    before_action :find_board, only: [:show, :edit, :update, :destroy]
    # before_filter :find_board, only: [:show, :edit, :update, :destroy]

    def index
        @boards = Board.all
        # render 'boards/index'
        # render html: "aaa"
    end

    def new
        @board = Board.new()
    end

    def show
        # find_board
        # begin
        #   @board = Board.find(params[:id])
        # rescue
        # redirect_to '/', notice: "Not FOund"
        # Board.find_by({id: 2, email: 'aa'})
        # Board.where(id: 4, name: 'aa') 
        # end

        # @posts = Post.where(boar: @board)
        # @posts = Post.where(boar_id: @board.id)
        @posts = @board.posts.order(id: :desc)
    end
    
    def create
        # return a hash clean_params = {"title" => 'jadiof'}
        # clean_params = params.require(:board).permit(:title)
        @board = Board.new(board_clean)
        # @board.title = params['board']
        # debugger

        if @board.save
            # success
            # flash["notice"] = "成功新增看板"
            redirect_to "/", notice: "成功新增看板"
        else
            # fail
            render :new # render 'boards/new'
        end
    end

    def edit
        # @board = Board.find(params[:id])
        # find_board
    end

    def update
        # @board = Board.find(params[:id])
        # find_board
        # clean_params = params.require(:board).permit(:title)
        if @board.update(board_clean)
            redirect_to root_path, notice: 'Update Success'
        else
            render :edit
        end
    end


    def destroy
        # @board = Board.find(params[:id])
        # find_board
        @board.destroy
        redirect_to root_path, notice: '看板已刪除'
    end



    private
    def find_board 
        @board = Board.find(params[:id])
    end

    def board_clean
        params.require(:board).permit(:title)
    end
end

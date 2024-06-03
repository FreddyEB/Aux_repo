class UserToBoardsController < ApplicationController
    before_action :set_board

    def new
        #busca a los usuarios disponibles
        @users = User.all - @board.users
        @user_to_board = UserToBoard.new(board_id: params[:board_id])
    end

    def create
        @user_to_board = UserToBoard.new(user_to_board_params)
        @user_to_board.board_id = @board.id
        if @user_to_board.save
          redirect_to @board, notice: 'User was successfully added to the board.'
        else
          render :new
        end
    end

    def destroy
      @user_to_board = UserToBoard.find(params[:id])
      if @user_to_board.destroy
        redirect_to @board, notice: 'User was successfully removed from the board.'
      else
        redirect_to @board, alert: 'Failed to remove user from the board.'
      end
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    private
    def user_to_board_params
        params.require(:user_to_board).permit(:user_id, :board_id)
    end
end
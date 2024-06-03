class BoardsController < ApplicationController
    before_action :authenticate_user!, only: %i[ show new create edit update destroy ]
    def index
        @boards = Board.all
        #@state = State.all
    end

    def show
        @board = Board.find(params['id'])
        @states = @board.states
        @tasks = []
        @states.each do |state| 
            @tasks << state.tasks
        end
    end

    def new
		@board = Board.new
	end

    def create  
		@board = Board.new(board_params)
		if @board.save!
            UserToBoard.create(user_id: board_params[:user_id], board_id: @board.id)
            flash[:notice] = 'Board was successfully created.'
			redirect_to boards_path
		else
            flash[:alert] = 'There was an error creating the board.'
			render :new
		end
	end

    def edit
		@board = Board.find(params[:id])
	end

    def update
		@board = Board.find(params[:id])
		if @board.update board_params
            flash[:notice] = 'Board was successfully updated.'
			redirect_to boards_path
		else
            flash[:alert] = 'There was an error updating the board.'
			render :edit
		end
	end

    def destroy
        @board = Board.find(params[:id])
        @board.destroy
    
        respond_to do |format|
          format.html { redirect_to boards_url, notice: "Board was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    def board_params
		params.require(:board).permit(:title, :description, :user_id)
	end
end
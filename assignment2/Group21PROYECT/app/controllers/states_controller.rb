class StatesController < ApplicationController
    before_action :authenticate_user!
    def index
        @states = State.all
        @user_board = UserToBoard.all
    end

    def show
        @state = State.find(params['id'])
        @tasks = @state.tasks
        @all_board = UserToBoard.where(board_id:@state.board)
    end

    def new
        if params[:board_id].present?
            @board = Board.find(params[:board_id])
            @state = @board.states.build
        else
		    @state = State.new
        end
	end

    def create  
		@state = State.new(state_params)
        respond_to do |format|
            if @state.save
                flash[:notice] = 'State was successfully created.'
                format.html { redirect_to states_path, notice: "State was successfully created." }
                format.json { render :show, status: :created, location: @state }
            else
                flash[:alert] = 'There was an error creating the state.'
                render :new
            end
        end
	end

    def edit
		@state = State.find(params[:id])
	end

    def update
		@state = State.find(params[:id])
		if @state.update state_params
                flash[:notice] = 'State was successfully updated.'
				redirect_to states_path
		else
                flash[:alert] = 'There was an error updating the state.'
				render :edit
		end
	end

    def destroy
        @state = State.find(params[:id])
        @state.destroy
    
        respond_to do |format|
          format.html { redirect_to states_path, notice: "State was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    def state_params
		params.require(:state).permit(:name, :board_id)
	end
end
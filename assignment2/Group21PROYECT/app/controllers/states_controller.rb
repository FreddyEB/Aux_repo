class StatesController < ApplicationController
    def index
        @states = State.all
    end

    def show
        @state = State.find(params['id'])
        @tasks = @state.tasks
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
                format.html { redirect_to state_url(@state), notice: "state was successfully created." }
                format.json { render :show, status: :created, location: @state }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @state.errors, status: :unprocessable_entity }
            end
        end
	end

    def edit
		@state = State.find(params[:id])
	end

    def update
		@state = State.find(params[:id])
		if @state.update state_params
				redirect_to states_path
		else
				render :edit
		end
	end

    def destroy
        @state = State.find(params[:id])
        @state.destroy
    
        respond_to do |format|
          format.html { redirect_to states_url, notice: "State was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    def state_params
		params.require(:state).permit(:name, :board_id)
	end
end
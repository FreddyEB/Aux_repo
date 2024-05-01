class BoardsController < ApplicationController
    def index
        @boards = Board.all
        #@state = State.all
    end

    def show
        @board = Board.find(params['id'])
        @state = State.find(params['id'])
        @states = @board.states
        @tasks = @state.tasks
    end
end
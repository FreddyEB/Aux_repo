class BoardsController < ApplicationController
    def index
        @board = Board.all
    end
end
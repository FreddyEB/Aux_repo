class StaticPagesController < ApplicationController
    def Home
        @recent_boards = Board.order(created_at: :desc).limit(5)
    end
end
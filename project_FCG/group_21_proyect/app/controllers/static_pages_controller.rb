class StaticPagesController < ApplicationController
    def Home
        @recent_boards = Board.order(created_at: :desc).limit(3)
    end
end
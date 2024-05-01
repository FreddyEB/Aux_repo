class StaticPagesController < ApplicationController
    def Home
    end
    def home
        @recent_boards = Board.order(created_at: :desc).limit(5)
    end
end
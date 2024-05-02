class Board < ApplicationRecord
    has_many :states
    has_many :user_to_boards
    has_many :users, through: :user_to_boards
end
class Board < ApplicationRecord
    has_many :states
    has_many :user_to_boards, class_name: 'UserToBoard'
end
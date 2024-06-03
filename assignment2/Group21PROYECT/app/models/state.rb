class State < ApplicationRecord
    belongs_to :board
    has_many :tasks, dependent: :destroy
    validates :name, presence: { message: "This field can't be blank" }
    validates :board_id, presence: { message: "Your state must be associated to a board" }

    def name_with_board
        "#{name} --> #{board.title}"
    end
end
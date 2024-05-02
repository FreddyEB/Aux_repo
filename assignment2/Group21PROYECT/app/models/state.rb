class State < ApplicationRecord
    belongs_to :board
    has_many :tasks
    validates :name, presence: { message: "This field can't be blank" }, uniqueness: { message: "This state already exists" }
    validates :board_id, presence: { message: "Your state must be associated to a board" }

    before_validation :normalize_name
    private
        def normalize_name
            self.name = name.downcase.titleize
        end
end
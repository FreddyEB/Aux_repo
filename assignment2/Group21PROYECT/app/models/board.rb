class Board < ApplicationRecord
    has_many :states, dependent: :destroy
    has_many :user_to_boards
    has_many :users, through: :user_to_boards

    validates :title, presence: { message: "You have to fill in your board title!" }
    validates :description, presence: { message: "You have put a descritpion for your board!" }

    after_create :default_states
    before_validation :normalize_title
    private
        def normalize_title
            self.title = title.downcase.titleize
        end

        def default_states
            states.create([{name: 'TODO'}, {name: 'WIP'}, {name: 'DONE'}])
        end
end
class State < ApplicationRecord
    belongs_to :board
    has_many :tasks
    validates :name, presence: { message: "This field can't be blank" }, uniqueness: { message: "This state already exists" }

    #has_many :post_tags
    #has_many :posts, through: :post_tags
end
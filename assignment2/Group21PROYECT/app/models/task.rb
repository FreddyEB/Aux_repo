class Task < ApplicationRecord
    belongs_to :user
    belongs_to :asignee_task
    belongs_to :state

    validates :title, presence: { message: "This field can't be blank" }
    validates :priority, presence:{ message: "Your task needs a priority level"}
    validates :user_id, presence:{ message: "Your task needs an associated User"}
    validates :state_id, presence:{ message: "Your task needs to be associated to a State"}
    validates :asignee_task_id, presence:{ message: "Your task needs an Assignee Id"}

    before_validation :normalize_title
    private
        def normalize_title
            self.title = title.downcase.titleize
        end
 end
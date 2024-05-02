class Task < ApplicationRecord
    belongs_to :user
    belongs_to :asignee_task
    belongs_to :state
 end
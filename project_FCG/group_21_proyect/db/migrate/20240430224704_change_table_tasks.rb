class ChangeTableTasks < ActiveRecord::Migration[7.1]
  def change
    change_table :tasks do |t|
      t.belongs_to :state
      t.belongs_to :user
    end
  end
end

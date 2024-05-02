class AddTableAsigneeTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :asignee_tasks do |t|
      t.belongs_to :user
    end
  end
end

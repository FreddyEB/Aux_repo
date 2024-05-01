class AddTableTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, default: ''
      t.text :description, null: false, default: ''
      t.string :priority, null: false,  default: ''
      t.string :custom_attributes, null: false, default: ''
      t.string :status, null: false, default: ''
      t.references :user
      t.references :state
      t.timestamps
    end
  end
end

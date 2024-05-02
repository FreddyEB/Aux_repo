class AddTableBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :title, null: false, default: ''
      t.text :description, null: false, default: ''
      t.belongs_to :user
      t.timestamps
    end
  end
end

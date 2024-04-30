class AddTableStates < ActiveRecord::Migration[7.1]
  def change
    create_table :states do |t|
      t.string :name, null: false, default: ''
      t.belongs_to :board
      t.timestamps
    end
  end
end

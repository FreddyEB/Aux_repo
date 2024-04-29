class UsersToBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :user_to_boards do |t|
      t.belongs_to :user
      t.belongs_to :board
    end
  end
end
class AddTeamToBoards < ActiveRecord::Migration[7.1]
  def change
    add_reference :boards, :team, foreign_key: true
  end
end

class AddDescriptionToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :description, :text
    add_reference :boards, :user, foreign_key: true
  end
end

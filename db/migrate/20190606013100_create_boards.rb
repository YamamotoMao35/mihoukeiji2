class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title, null: false, unique: true, index: true
      t.timestamps
    end
  end
end

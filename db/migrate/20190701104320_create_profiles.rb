class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :site
      t.text :organization
      t.integer :prefecture_id
      t.text :self_introduction
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

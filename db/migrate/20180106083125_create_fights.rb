class CreateFights < ActiveRecord::Migration[5.1]
  def change
    create_table :fights do |t|
      t.integer :type
      t.integer :belong_match
      t.integer :user_id
      t.string :replay

      t.timestamps
    end
  end
end

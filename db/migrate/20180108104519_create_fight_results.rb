class CreateFightResults < ActiveRecord::Migration[5.1]
  def change
    create_table :fight_results do |t|
      t.integer :fight_id
      t.integer :user_id
      t.float :live_time
      t.float :hp_left
      t.float :dmg

      t.timestamps
    end
  end
end

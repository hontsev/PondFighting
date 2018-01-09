class CreateUserLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_logs do |t|
      t.integer :user_id
      t.integer :fight_id
      t.string :message

      t.timestamps
    end
  end
end

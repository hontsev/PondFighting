class CreateDucks < ActiveRecord::Migration[5.1]
  def change
    create_table :ducks do |t|
      t.string :name
      t.string :script
      t.integer :user_id
      t.boolean :is_block
      t.boolean :is_delete
      t.boolean :is_public
      t.integer :win_count
      t.integer :lose_count
      t.integer :draw_count

      t.timestamps
    end
  end
end

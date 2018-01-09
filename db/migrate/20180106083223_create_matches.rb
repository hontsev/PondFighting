class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.boolean :is_end
      t.integer :user_id

      t.timestamps
    end
  end
end

class AddDuckId < ActiveRecord::Migration[5.1]
  def change
	add_column :fight_results, :duck_id, :integer
  end
end

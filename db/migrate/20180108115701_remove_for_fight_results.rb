class RemoveForFightResults < ActiveRecord::Migration[5.1]
  def change
	remove_column :fight_results, :user_id
  end
end

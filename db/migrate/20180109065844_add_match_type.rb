class AddMatchType < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :type, :integer
  end
end

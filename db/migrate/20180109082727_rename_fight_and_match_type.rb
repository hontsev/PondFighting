class RenameFightAndMatchType < ActiveRecord::Migration[5.1]
  def change
    rename_column :fights, :type, :tag
	rename_column :matches, :type, :tag
  end
end

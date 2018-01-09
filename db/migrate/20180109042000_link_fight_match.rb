class LinkFightMatch < ActiveRecord::Migration[5.1]
  def change
    rename_column :fights, :belong_match, :match_id
  end
end

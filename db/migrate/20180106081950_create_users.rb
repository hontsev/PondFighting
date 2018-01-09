class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :nickname
      t.string :introduce
      t.string :email
      t.string :avatar

      t.timestamps
    end
  end
end

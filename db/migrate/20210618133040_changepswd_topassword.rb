class ChangepswdTopassword < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :pswd, :password
  end
end

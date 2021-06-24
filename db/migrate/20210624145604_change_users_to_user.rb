class ChangeUsersToUser < ActiveRecord::Migration[6.1]
  def change
    rename_table :users, :user
  end
end

class ChangeNameToFirstname < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :name, :first_name
  end
end

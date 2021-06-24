class AddTimeStampsToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.timestamps
    end
  end
end

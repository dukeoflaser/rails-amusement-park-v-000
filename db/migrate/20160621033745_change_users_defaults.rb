class ChangeUsersDefaults < ActiveRecord::Migration
  def change
    change_column :users, :height, :integer, default: 0
    change_column :users, :happiness, :integer, default: 0
    change_column :users, :nausea, :integer, default: 0
    change_column :users, :tickets, :integer, default: 0
  end
end

class DropUsersAuthlogic < ActiveRecord::Migration
  def up
	drop_table :users
  end

  def down
  end
end

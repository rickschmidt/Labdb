class DeleteJoinTables < ActiveRecord::Migration
  def up
	drop_table :dnasamples_projects
  end

  def down
  end
end

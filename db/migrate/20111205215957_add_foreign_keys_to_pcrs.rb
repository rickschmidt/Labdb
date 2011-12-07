class AddForeignKeysToPcrs < ActiveRecord::Migration
  def change
		add_column :pcrs, :dnasample_id, :integer
		add_column :pcrs, :project_id, :integer
  end
end
class AddTubeStatusToTubeModel < ActiveRecord::Migration
  def change
	add_column :tubes, :success, :boolean
	add_column :tubes, :ready, :boolean
  end
end

class ExperimentJoinIdsToProjectJoinIds < ActiveRecord::Migration
  def up
		rename_column :dnasamples_projects, :experiment_id, :project_id
		rename_table :projects_pcrs, :pcrs_projects
		rename_column :pcrs_projects, :experiment_id, :project_id
  end

  def down
  end
end
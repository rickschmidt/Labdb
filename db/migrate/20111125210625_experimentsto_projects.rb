class ExperimentstoProjects < ActiveRecord::Migration
  def up
		rename_column :experiments, :experiment_number, :project_name
		rename_table :experiments, :projects
		rename_table :dnasamples_experiments, :dnasamples_projects
		rename_table :experiments_pcrs, :projects_pcrs
  end

  def down
  end
end
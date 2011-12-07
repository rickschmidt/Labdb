class AddGeneIDtoDnasample < ActiveRecord::Migration
  def up
		add_column :dnasamples, :gene_id, :integer
  end

  def down
	remove_column :dnasamples, :gene_id
  end
end
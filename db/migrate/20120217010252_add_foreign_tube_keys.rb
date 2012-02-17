class AddForeignTubeKeys < ActiveRecord::Migration
  def up
			add_column :pcrs, :tube_id, :integer
  end

  def down
	remove_column :pcrs, :tube_id
  end
end

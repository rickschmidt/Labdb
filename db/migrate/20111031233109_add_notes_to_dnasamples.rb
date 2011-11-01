class AddNotesToDnasamples < ActiveRecord::Migration
  def change
	add_column :dnasamples, :extraction_notes, :text
  end
end

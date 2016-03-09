class RenameCategoryToCategroyId < ActiveRecord::Migration
  def change
    rename_column :businesses, :category, :category_id
  end
end

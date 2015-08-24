class RenameColumTypeInJawbones < ActiveRecord::Migration
  def change
    rename_column :jawbones, :type, :jawbone_type
  end
end

class RenameJawboneTimestamp < ActiveRecord::Migration
  def change
    rename_column :jawbones, :timestap, :timestamp
  end
end

class AddColumnToJawbones < ActiveRecord::Migration
  def change
    add_column :jawbones, :data, :text
  end
end

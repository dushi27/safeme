class AddTimestapToJawbones < ActiveRecord::Migration
  def change
    add_column :jawbones, :timestap, :string
  end
end

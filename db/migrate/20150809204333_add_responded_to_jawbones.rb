class AddRespondedToJawbones < ActiveRecord::Migration
  def change
    add_column :jawbones, :responded, :boolean
  end
end

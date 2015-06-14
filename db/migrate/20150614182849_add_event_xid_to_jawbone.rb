class AddEventXidToJawbone < ActiveRecord::Migration
  def change
    add_column :jawbones, :event_xid, :string
  end
end

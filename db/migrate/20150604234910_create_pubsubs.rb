class CreatePubsubs < ActiveRecord::Migration
  def change
    create_table :pubsubs do |t|
      t.string :user_xid
      t.string :type
      t.string :action
      t.string :timestamp

      t.timestamps
    end
  end
end

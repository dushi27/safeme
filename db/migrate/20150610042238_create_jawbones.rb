class CreateJawbones < ActiveRecord::Migration
  def change
    create_table :jawbones do |t|
      t.string :user_xid
      t.string :type
      t.string :action

      t.timestamps
    end
  end
end

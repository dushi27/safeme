class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :xid
      t.string :firstname
      t.string :lastname
      t.string :my_num
      t.string :e_num1
      t.string :e_num2
      t.string :token

      t.timestamps
    end
  end
end

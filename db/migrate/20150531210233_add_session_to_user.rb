class AddSessionToUser < ActiveRecord::Migration
  def change
    add_column :users, :session, :string
  end
end

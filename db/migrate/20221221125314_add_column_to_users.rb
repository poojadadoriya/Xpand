class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
     # add_column :users, :password_digest, :string
     # remove_column :users, :password_confirmation, :string
     # remove_column :users, :password, :string
     remove_column :users, :uid, :string
  end
end

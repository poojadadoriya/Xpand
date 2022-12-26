class AddUserReferenceToCorse < ActiveRecord::Migration[7.0]
  def change
    add_reference :corses, :user, index: true
     remove_reference :users, :corse
     add_column :users, :block, :boolean, default: false
     add_column :users, :unblock, :boolean, default: true
  end
end

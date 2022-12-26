class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      
      t.string :issue_type
      t.references :user

      t.timestamps
    end
  end
end

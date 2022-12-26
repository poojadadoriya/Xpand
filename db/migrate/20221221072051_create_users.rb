class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :password_confirmation
      t.references :corse, index: true

      t.timestamps
    end
  end
end

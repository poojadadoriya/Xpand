class AddOtpSecretKeyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :otp_secret_key, :string
    add_column :users, :user_type, :string
  end
end

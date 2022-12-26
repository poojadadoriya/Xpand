class User < ApplicationRecord
   include ActiveStorageSupport::SupportForBase64
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
  
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
	has_many :corses
    has_many :contacts
  # has_one_time_password column_name: :my_otp_secret_column, length: 4
    has_one_base64_attached :picture



  def generate_password_token
     self.reset_password_token = generate_token
     self.reset_password_sent_at = Time.now.utc
    UserMailer.password_reset(self).deliver_now
     save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 1.hour) > Time.now.utc
  end

  def reset_password(password)
   self.reset_password_token = nil
   self.password = password
   save!
  end

  private

  def generate_token
   SecureRandom.hex(10)
  end
  
end

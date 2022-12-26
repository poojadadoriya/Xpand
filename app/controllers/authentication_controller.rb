class AuthenticationController < ApplicationController 
	 before_action :authorize_request, except: :login
   protect_from_forgery with: :null_session

  def login
    @user = User.find_by_email(params[:email])
     if @user.present? && @user.block == true
      render json: {error: 'you are blocked, please contact to admin'}
    elsif   
      @user&.valid_password?(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: {email: @user.email, token: token }, status: :ok
    elsif
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  
  end

  private

  def login_params
    params.permit(:email, :password)
  end
  

end

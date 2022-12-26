class Api::V1::UsersController < ApplicationController
	  protect_from_forgery with: :null_session

	  before_action :authorize_request, except: [:create, :update, :index, :create_contact]
	  # before_action :find_user, except: %i[create index update]

  

  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user)
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end


  def update
    @user = User.find_by(id: params[:id])
    if @user.present?
      @user.update(update_params)
      render json: UserSerializer.new(@user)
    else
      render json: {errors: ['Unrecognized User']}
    end
  end

  def update_params
    params.permit(:first_name, :last_name, picture: :data)
  end

  
  def user_params
    params.permit(:email, :password, :corse_id, :user_type)    
  end


  def index
    @user = User.where(user_type: params[:expert])
    if @user.present?
      render json: UserSerializer.new(@user)
    else
      render json: {errors: ['Not present']}
    end
  end

  
  
end
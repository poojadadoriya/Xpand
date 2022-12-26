class ContactController < ApplicationController
    protect_from_forgery with: :null_session

  def create_contact

    @contact = Contact.new(contact_params)
    if @contact.save
      render json: ContactSerializer.new(@contact)
    else
      render json: {errors: @contact.errors.full_messages}
    end
  end

  def contact_params
    params.permit(:issue_type, :user_id)
  end

  def show_contact
    @user = User.find_by(id: params[:id])
    if @user.present?
      render json: ContactSerializer.new(@user)
    else
      render json: {error: @user.errors.full_messages}
    end
  end
end
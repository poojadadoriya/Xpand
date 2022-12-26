class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :email
  
   attributes :picture do |object|
      object.picture.present? ? Rails.application.routes.url_helpers.url_for(object.picture) : ''
    end
end
require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  before(:each) do |example|
    @user = User.create(email: "pd@yp.in", password: "pd@123", user_type: "expert")
  end
  describe "POST Create user" do
    it "create user" do
      
      post "/api/v1/users",  params: {
                                      "email": "pd@yop.in",
                                      "password": "pd@123",
                                      "user_type": "expert"
                                      }
                                      
        data = JSON.parse(response.body)
        expect(data["data"]["attributes"]["email"]).to eq("pd@yop.in")
      expect(response).to have_http_status(200)
    end
  end


  describe "put/users" do
    before(:each) do |example|
      byebug
    @user = User.create(email: "pd@yp.in", password: "pd@123", user_type: "expert", last_name: "f")
  end
    it "it will update user" do
     put "/api/v1/users/#{@user.id}",  params: {
                                            "last_name": "dadoriya"
                                            }
                                            byebug
                                     
      data = JSON.parse(response.body)
      expect(data["data"]["attributes"]["last_name"]).to eq("dadoriya")                                 
      expect(response).to have_http_status(200)
    end
  end



end

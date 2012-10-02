require 'spec_helper'

# A note on get args
# get action, params_hash, session_hash, flash_hash

describe SessionsController do

  def valid_twitter_omniauth
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :uid => '123545',
      :info => {:name => "Mike Williamson"}
    })
    OmniAuth.config.mock_auth[:twitter]
  end

  #OmniAuth.config.mock_auth[:twitter] = :invalid_credentials

  def valid_session
    {"oauth"=>{"twitter"=>{"callback_confirmed"=>true}}, "user_id"=>1}
  end


  describe "GET create" do

    describe "for a first time user" do

      before :each do
        request.env["omniauth.auth"] = valid_twitter_omniauth
        get :create, { provider: :twitter, locale: "en" }
      end

      it "creates a user" do
        User.count.should == 1
      end

      it "sets the name attribute of the user" do
        User.first.name.should eq("Mike Williamson")
      end

      it "sets the users id in the session" do
        session["user_id"].should eq(User.first.id)
      end

      it "redirects to root path after creation" do
        response.should redirect_to root_path
      end

      it "sets a flash message" do
        flash[:notice].should match("logged in")
      end
    end

    describe "logging in again with the same provider" do

      before :each do
        request.env["omniauth.auth"] = valid_twitter_omniauth
        get :create, { provider: :twitter, locale: "en" }
        session[:user_id] = nil
        # now log in again
        get :create, { provider: :twitter, locale: "en" }
      end

      it "does not create another user" do
        User.count.should eq(1)
      end

    end
    describe "for a logged out user logging in with a new provider"
    describe "for a logged in user logging in with the same provider"
    describe "for a logged in user loggin in with a new provider"

  end


end

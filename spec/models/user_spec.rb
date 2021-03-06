require 'spec_helper'

describe User do

  def valid_twitter_omniauth
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :uid => '123545',
      :info => { :name => "dexterchief"}
    })
    OmniAuth.config.mock_auth[:twitter]
  end

  def valid_google_omniauth
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      :provider => 'google',
      :uid => '123545',
      :info => { :name => "Mike Williamson", :email => "test@example.com"}
    })
    OmniAuth.config.mock_auth[:google]
  end

  let(:user){ User.create_from_omniauth(valid_twitter_omniauth) }

  it "creates a new user based on an omniauth hash" do
    user.should_not be_nil
  end

  it "populates user attributes with the data in the hash" do
    user.name.should eq("dexterchief")
  end

  it "assigns the guest role by default" do
    user.has_role?(:admin).should be_false
    user.has_role?(:guest).should be_true
  end



end

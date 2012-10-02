require 'spec_helper'

describe Authentication do

  def valid_google_omniauth
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      :provider => 'google',
      :uid => '123545',
      :info => { :name => "Mike Williamson", :email => "test@example.com"}
    })
    OmniAuth.config.mock_auth[:google]
  end

  before :each do
    Authentication.create_from_omniauth(valid_google_omniauth)
  end

  let(:auth) do
    provider = valid_google_omniauth["provider"]
    uid = valid_google_omniauth["uid"]
    Authentication.find_by_provider_and_uid!(provider, uid)
  end

  it "creates an authentication from an omniauth hash" do
    Authentication.count.should eq 1
  end

  it "sets provider attribute" do
    auth.provider.should eq("google")
  end

  it "sets uid attribute" do
    auth.uid.should eq("123545")
  end

  it "creates an associated user model" do
    auth.user.should_not be_nil
  end

end

class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :create, :destroy, :index, :provider, :uid, :user_id
  #ensure that the combination of uid and provider is unique
  validates_uniqueness_of :uid, scope: :provider

  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"])
  end

  def self.create_from_omniauth(auth)
    user = User.create_from_omniauth(auth)
    create! do |authentication|
      authentication.uid = auth["uid"]
      authentication.provider = auth["provider"]
      authentication.user = user
    end
  end

end

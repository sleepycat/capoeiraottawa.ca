class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :create, :destroy, :index, :provider, :uid, :user_id


  def self.from_omniauth(auth)
    create do |authentication|
      puts auth.to_yaml
      authentication.uid = auth["uid"]
      authentication.provider = auth["provider"]
    end
  end

end

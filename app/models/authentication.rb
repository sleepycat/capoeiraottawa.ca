class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :create, :destroy, :index, :provider, :uid, :user_id
  #ensure that the combination of uid and provider is unique
  validates_uniqueness_of :uid, scope: :provider


  def self.from_omniauth(auth)
    create do |authentication|
      authentication.uid = auth["uid"]
      authentication.provider = auth["provider"]
    end
  end

end

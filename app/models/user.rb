class User < ActiveRecord::Base

  has_many :roles
  has_many :authentications, dependent: :destroy

  after_create :assign_roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :nickname, :image, :website

  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
  end


  def assign_roles
    self.roles<<Role.new(:title => 'guest')
  end

  def has_role? role
    self.roles.collect{|r| r.title.to_sym}.include? role
  end

  def self.create_from_omniauth(auth)
      create! do |user|
        user.name = auth["info"]["name"]
        user.email = auth["info"]["email"] if auth["info"]["email"]
    end
  end

end

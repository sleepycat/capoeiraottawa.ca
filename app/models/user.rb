class User < ActiveRecord::Base

  has_many :roles
  has_many :authentications

  after_create :assign_roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
  end


  def assign_roles
    self.roles<<Role.new(:title => 'user')
  end

  def has_role? role
    self.roles.collect{|r| r.title.to_sym}.include? role
  end

  def self.from_omniauth(auth)
    create do |user|
      user.authentications << Authentication.from_omniauth(auth)
    end
  end
end

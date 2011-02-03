class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :roles

  
  after_create :assign_roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

   def role_symbols
     (roles || []).map {|r| r.title.to_sym}
   end


  def assign_roles
    self.roles<<Role.new(:title => 'author')
  end

  def has_role? role
    self.roles.collect{|r| r.title.to_sym}.include? role
  end  
end

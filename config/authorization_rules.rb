
#
#This is the global permissions file for Declarative Authorization.


authorization do
  role :admin do
    has_omnipotence
  end

  role :author do
    has_permission_on :authorization_rules, :to => :read
    includes :guest 
  end

  role :guest do
    has_permission_on :events, :locations, :gcsjas, :to => [:show, :index]
    has_permission_on :users, :to => [:create, :new, :update]
  end
end

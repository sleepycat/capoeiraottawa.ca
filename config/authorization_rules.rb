
#
#This is the global permissions file for Declarative Authorization.


authorization do
  role :admin do
    has_omnipotence
    ##has_permission_on [:locations, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  role :author do
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :locations, :to => [:index, :show]
    has_permission_on :events, :to => [:index, :show]
    has_permission_on :users, :to => [:create, :new, :update]
    
  end

  role :guest do
    has_permission_on :locations, :to => [:index, :show]
    has_permission_on :events, :to => [:index, :show]
    has_permission_on :users, :to => [:create, :new, :update]
  end
end

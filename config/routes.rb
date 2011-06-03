Angola::Application.routes.draw do

  scope "/:locale", :locale => /en|br|fr/ do
    #These routes will get eaten by the matches for gcjsa so they need to be above them.
    resources :videos, :only => :index

    devise_for :users

    resources :practices

    resources :links

    resources :locations

    resources :events do
      member do 
        get :posters
      end
    end

    #the :as option creates _path and _url helpers for whatever value you give it.
    match ':attr' => 'gcsjas#show', :via => :get, :attr => Gcsja.attrs_rgx, :as => :gcsja_show
    match ':attr/edit' => 'gcsjas#edit', :via => :get, :attr => Gcsja.attrs_rgx, :as => :gcsja_edit
    match ':attr/edit' => 'gcsjas#update', :via => :post, :attr => Gcsja.attrs_rgx, :as => :gcsja_update
  end

  match '/:locale', :to => redirect(){|params|"/#{params[:locale]}/welcome"}
  root :to => redirect("/en/welcome")

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

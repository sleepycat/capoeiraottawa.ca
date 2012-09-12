Angola::Application.routes.draw do

  get "auth/:provider/callback", to: "sessions#create"

  scope ":locale", :locale => /en|br|fr/ do
    get "login", to: "sessions#index", as: :login
    delete "logout", to: "sessions#destroy", as: :logout
    resources :videos, :practices, :locations
    get "pages/new", to: "pages#new", as: :new_page
    post "pages", to: "pages#create", as: :pages
    put ":page_title", to: "pages#update"
    get ":page/edit", to: "pages#edit", as: :edit_page
    get ":page", to: "pages#show", as: :page
    delete ":page", to: "pages#destroy", as: :page
    get "", to: "pages#index"

  end

  root :to => redirect('/en')

end

Angola::Application.routes.draw do

  scope ":locale", :locale => /en|br|fr/ do
    resources :videos, :practices, :locations
    resources :pages, except: [:show, :edit, :update, :new]
    get "pages/new", to: "pages#new", as: :new_page
    put ":page_title", to: "pages#update"
    get "pages/:page/edit", to: "pages#edit", as: :edit_page
    get ":page", to: "pages#show", as: :page
    get "", to: "pages#index"

  end

  root :to => redirect('/en')

end

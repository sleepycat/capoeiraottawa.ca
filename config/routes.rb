Angola::Application.routes.draw do

  scope "/:locale", :locale => /en|br|fr/ do

    resources :videos

    resources :practices

    resources :locations

    get ':page' => 'pages#show', as: "page"

  end

end

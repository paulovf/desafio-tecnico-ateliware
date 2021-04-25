Rails.application.routes.draw do
    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root :to => 'index#index'
    get 'get_list_repositories', to: 'index#get_list_repositories'
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'countries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :bookmark_visa_results, only: [ :new, :create]
    get "/bookmarks", :to => "bookmark_visa_results#bookmark_visa_results"
  
    resources :bookmark_embassies, only: [ :new, :create]
    get "/bookmarks", :to => "bookmark_embassies#bookmark_embassies"
  end
  resources :countries, only: [:index, :show]
  #get :visa_results_display, :to => "visa_results#visa_result_display"
  resources :visa_results, only: [:create, :show]
  #get :visa_results, :to => "visa_results#visa_results"
  resources :embassies, only: [:index, :show]


  delete "/bookmark_visa_results/:id", :to => "bookmark_visa_results#destroy"
  delete "/bookmark_embassies/:id", :to => "bookmark_embassies#destroy"
end

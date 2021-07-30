Rails.application.routes.draw do
  devise_for :users
  root to: 'countries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :bookmark_visa_results, only: [ :create]
    resources :bookmark_embassies, only: [ :create]
  end
  resources :countries, only: [:index, :show]

  get "users/:id/bookmarks", :to => "users#bookmarks", :as => "user_bookmarks"
  get "users/:id/FAQ", :to => "users#faq", :as => "faq"
 
  #get :visa_results_display, :to => "visa_results#visa_result_display"
  resources :visa_results, only: [:create, :show]
  #get :visa_results, :to => "visa_results#visa_results"
  resources :embassies, only: [:index, :show]


  delete "/bookmark_visa_results/:id", :to => "bookmark_visa_results#destroy", :as => "delete_visa_result_bookmark"
  delete "/bookmark_embassies/:id", :to => "bookmark_embassies#destroy", :as => "delete_embassy_bookmark"
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  match "/422", to: "errors#unprocessable_entity", via: :all

end

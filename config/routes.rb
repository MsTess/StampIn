Rails.application.routes.draw do
  devise_for :users
  root to: 'countries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :countries, only: [:index, :show]
  #get :visa_results_display, :to => "visa_results#visa_result_display"
  resources :visa_results, only: [:create, :show]
  #get :visa_results, :to => "visa_results#visa_results"
  post "/countries/:id/bookmark_result", :to => "countries#bookmark_result"
  delete "/countries/:id/remove_result_bookmark/:id", :to => "countries#remove_result_bookmark"
  resources :embassies, only: [:index, :show]
  post "/embassies/:id/bookmark_embassy", :to => "embassies#bookmark_embassy"
  delete "/embassies/:id/remove_embassy_bookmark/:id", :to => "embassies#remove_embassy_bookmark"
end

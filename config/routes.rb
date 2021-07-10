Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :countries, only: [:index] do
    get :visa_results_display, on: :member
    get :visa_results, on: :collection
  end
  #resources :countries, only: [:show]
  post "/countries/:id/bookmark_result", :to => "countries#bookmark_result"
  delete "/countries/:id/remove_result_bookmark/:id", :to => "countries#remove_result_bookmark"
  resources :embassies, only: [:index, :show]
  post "/embassies/:id/bookmark_embassy", :to => "embassies#bookmark_embassy"
  delete "/embassies/:id/remove_embassy_bookmark/:id", :to => "embassies#remove_embassy_bookmark"
end

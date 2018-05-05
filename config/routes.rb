Rails.application.routes.draw do
  get '/products/less_stock_products', to: "products#less_stock_products"
  resources :products
  root :to => 'home#index'
  get "/",to: "home#index"
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

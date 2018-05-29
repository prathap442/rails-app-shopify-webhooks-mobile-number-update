Rails.application.routes.draw do
  root "home#index"
  post '/mobile_updates/update_the_customer_details',to: "mobile_updates#update_the_customer_details"
  post "apps/mobile_updates/update_the_customer_details",to: "app_proxy/mobile_number_storers#create"
  post "apps/mobile_number_storers",to: "app_proxy/mobile_number_storers#create"
  post "app_proxy/mobile_number_storers",to:"app_proxy/mobile_number_storers#create"
  namespace :app_proxy do 
    resources :mobile_number_storers
  end  
  get "/webhooktester/create_a_test_webhook",to: "webhooktester#create_a_test_webhook"
  post "/webhooks",to: "webhooktester#create_a_test_webhook"
  resources :webhooktester
  # get '/webhooktester/create_a_test_webhook',to: "webhooktester#create_a_test_webhook"
  resources :people
  devise_for :users
  get '/people/send_email_for_the_person'
  get '/products/less_stock_products', to: "products#less_stock_products"
  resources :products
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

ShopifyApp.configure do |config|
  #config.root_url = '/nested'
  config.application_name = "My Shopify App"
  config.api_key = "28916e520af2374732e5682d8d99d92c"
  config.secret = "c90ea3c8bdbe61f8122ad717eee030c4"
  config.scope = "read_orders, read_products, read_customers, read_draft_orders"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop  
end

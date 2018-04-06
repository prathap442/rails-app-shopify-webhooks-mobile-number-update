ShopifyApp.configure do |config|
  #config.root_url = '/nested'
  config.application_name = "My Shopify App"
  config.api_key = "f02902dd4ed447a7c4cdb57598419c7b"
  config.secret = "b598b8de868704a6cc4056bdd0d853a2"
  config.scope = "read_orders, read_products, read_customers, read_draft_orders"
  config.embedded_app = false
  config.after_authenticate_job = false
  config.session_repository = Shop
  
end

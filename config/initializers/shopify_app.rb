ShopifyApp.configure do |config|
  #config.root_url = '/nested'
  config.application_name = "My Shopify App"
  config.api_key = "28916e520af2374732e5682d8d99d92c"
  config.secret = "7b4e548c0a293e14226b39dccc0f51c2"
  config.scope = "read_orders, read_products, read_customers, read_draft_orders, write_customers"
  config.embedded_app = true
  config.after_authenticate_job = false
  #binding.pry
  config.session_repository = Shop  
  config.webhooks = [
    {topic: 'products/create', address: 'https://vadlaputi-departmental-stores.myshopify.com/webhooks', format: 'json'},
  ]
end

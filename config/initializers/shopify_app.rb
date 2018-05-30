ShopifyApp.configure do |config|
  #config.root_url = '/nested'
  config.application_name = "My Shopify App"
  config.api_key = "9b0b0fe7c3115f8d629edf91ba45cb04"
  config.secret = "7b6212eef1dd85f579471a81402fdda4"
  config.scope = "read_orders, read_products, read_customers, read_draft_orders, write_customers,read_themes, write_themes"
  config.embedded_app = true
  config.after_authenticate_job = false
  #binding.pry
  config.session_repository = Shop  
  binding.pry
  config.webhooks = [
    {topic: 'customers/create', address: 'https://3a3740f6.ngrok.io/webhooks', format: 'json'},
  ]
end

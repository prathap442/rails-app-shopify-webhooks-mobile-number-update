class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @cart = ShopifyAPI::Cart.find(:all, params: {limit: 10})
    @customers = ShopifyAPI::Customer.all
    @orders = ShopifyAPI::Order.all
    binding.pry
  end
end

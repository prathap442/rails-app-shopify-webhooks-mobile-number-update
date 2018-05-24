class ProductsCreateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    binding.pry
    shop = Shop.find_by(shopify_domain: shop_domain)
    binding.pry 
    shop.with_shopify_session do
    end
  end
end

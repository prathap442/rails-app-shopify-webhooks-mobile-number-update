class ProductsController < ShopifyApp::AuthenticatedController
  def index 
    @products = ShopifyAPI::Product.all
  end
  def less_stock_products
  	 binding.pry 
    @products = find_the_stock_less_products
  end
  private 
  def find_the_stock_less_products
    arr1 = []
    products = ShopifyAPI::Product.all
    products.each do |product_object|
       arr1.push(product_object) if product_object.variants[0].attributes[:inventory_quantity].to_i < 20
    end
    return arr1 
  end 	
end
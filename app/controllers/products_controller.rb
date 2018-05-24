class ProductsController < ShopifyApp::AuthenticatedController
  skip_before_action :verify_authenticity_token
 
  def index 
    @products = ShopifyAPI::Product.all
  end
 
  def less_stock_products
  	 binding.pry 
    @products = find_the_stock_less_products
  end
  def new 
    @product= ShopifyAPI::Product.new  
  end
 
  def create
    @product = ShopifyAPI::Product.new(product_params)
    binding.pry
    if @product.save
      format.html { redirect_to @product, notice: 'Product was successfully created.' }
      format.json { render :show, status: :created, location: @product }
    else
      format.html { redirect_to @product, notice: 'Product was successfully created.' }
      format.json { render :edit, status: :unprocessable_entity, location: @product }
    end
  end

  def show
    @product =ShopifyAPI::Product.find(params[:id])
  end
  def edit
    @product = ShopifyAPI::Product.new(product_params)
    render action: "new"
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

  def product_params
   params[:product].permit(:title,:inventory_quantity,:variants,:price,:body_html)
  end  


end
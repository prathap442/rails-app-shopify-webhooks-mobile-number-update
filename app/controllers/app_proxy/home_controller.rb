module AppProxy
	class HomeController < ShopifyApp::AuthenticatedController
		protect_from_forgery
		around_action :shopify_session
	  def index
	    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
	    @webhooks = ShopifyAPI::Webhook.find(:all)
	    binding.pry
	    @cart = ShopifyAPI::Cart.find(:all, params: {limit: 10})
	    current_shop = ShopifyAPI::Shop.current
	    @customers = ShopifyAPI::Customer.all

	    #create customer
	    #shop_url = "https://28916e520af2374732e5682d8d99d92c:7b4e548c0a293e14226b39dccc0f51c2@vadlaputi-departmental-stores.myshopify.com/admin"
	    # p "shop name@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2"
	    # p shop_url
	    # ShopifyAPI::Base.site = shop_url
        # binding.pry
	     #  @orders = HTTParty.get("https://50a5d25b196006b2dcbd4843c8e65ead:be77b2ca48a03d3e23237e39a0a53947@vadlaputi-departmental-stores.myshopify.com/products.json")
	     #  binding.pry
	     #  HTTParty.put("https://50a5d25b196006b2dcbd4843c8e65ead:be77b2ca48a03d3e23237e39a0a53947@vadlaputi-departmental-stores.myshopify.com/admin/customers/496152150068.json",
	     #  	body:{
		   # "customer": {
	       #   "id": 207119551,
		   #   "email": "changed@gmail.com",
		   #   "note": "Customer is a great guy"
		   # }
	   # })
	   render text: "OK"
	  end
	  def update_the_customer_details
	  	p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	  	# binding.pry
	    @customer = ShopifyAPI::Customer.find(email: params[:email])
	    binding.pry
	    @customer.phone = params[:phone]
	    binding.pry
	    @customer.save!
	    render text: "OK"
	  end	
    end
end
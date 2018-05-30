class HomeController < ShopifyApp::AuthenticatedController
		protect_from_forgery #with: :null_session
	  def index
	    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
	    @webhooks = ShopifyAPI::Webhook.find(:all)
	      @cart = ShopifyAPI::Cart.find(:all, params: {limit: 10})
	    current_shop = ShopifyAPI::Shop.current
	    @customers = ShopifyAPI::Customer.all
	    token = Shop.where(shopify_domain: ShopifyAPI::Shop.current.attributes["myshopify_domain"])[0].shopify_token
		session = ShopifyAPI::Session.new(ShopifyAPI::Shop.current.attributes["myshopify_domain"],token)
		puts session.token
		binding.pry
		#permissiosn_url = session.create_permission_url(scope, "https://#{params[:shop]}/auth/shopify/callback");	  
		puts ShopifyAPI::Base.activate_session(session)
		ShopifyAPI::Base.clear_session

		respond_to do |format|
		    format.html
		    format.csv { send_data (@customers.to_csv) }
		    # format.csv {
		    #   filename = "Posts-#{Time.now.strftime("%Y%m%d%H%M%S")}.csv"
		    #   send_data(@posts.to_csv, :type => "text/csv; charset=utf-8; header=present", :filename => filename)
		    # }
		end  
	  end
	  private
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
	    #})
	  def update_the_customer_details(customer)
	  end	
end

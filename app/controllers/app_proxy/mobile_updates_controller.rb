class AppProxy::MobileUpdatesController < ShopifyApp::AuthenticatedController
   include ShopifyApp::AppProxyVerification 
    include HTTParty
    protect_from_forgery
  def update_the_customer_details
   p "JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ"
   #this is https://api_key:secret
   shop_url  = "https://9b0b0fe7c3115f8d629edf91ba45cb04:7b6212eef1dd85f579471a81402fdda4@#{params[:shop]}/admin";
   ShopifyAPI::Base.site = shop_url

   session = ShopifyAPI::Session.new(params[:shop])
   scope = ["write_customers, read_customers"]
   permission_url = session.create_permission_url(scope)
   ShopifyAPI::Base.activate_session(session)
	  	# perform_the_following_method
	    @customer = ShopifyAPI::Customer.find(email: params[:email])
	    binding.pry
	    @customer.phone = params[:phone]
	    binding.pry
	    @customer.save!
	    render text: "OK"
  end
  private
  def perform_the_following_methods
   # binding.pry
   p "beooooooooooooooooooooooooo"
    shop_url  = "https://50a5d25b196006b2dcbd4843c8e65ead:be77b2ca48a03d3e23237e39a0a53947@vadlaputi-departmental-stores.myshopify.com/admin";
   ShopifyAPI::Base.site = shop_url

   session = ShopifyAPI::Session.new("vadlaputi-departmental-stores.myshopify.com")
   scope = ["write_customers, read_customers"]
   permission_url = session.create_permission_url(scope)
   ShopifyAPI::Base.activate_session(session)
   binding.pry
  end	
end

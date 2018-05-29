class MobileNumberStorer < ActiveRecord::Base
  include ShopifyApp::SessionStorage
  validates_presence_of :mobile_number,:email_id
  def self.update_the_customer_info_after_2_minutes(options={})#shop,email_id,mobile_number
  	      binding.pry
  		  shop_url  = "https://9b0b0fe7c3115f8d629edf91ba45cb04:7b6212eef1dd85f579471a81402fdda4@#{params[:shop]}/admin";
		  ShopifyAPI::Base.site = shop_url
		  token = Shop.where(shopify_domain: params[:shop])[0].shopify_token
		  session = ShopifyAPI::Session.new(params[:shop])
		  session.token = token
		  scope = ["write_customers,read_customers"]
		  permission_url = session.create_permission_url(scope)
		  puts ShopifyAPI::Base.activate_session(session)
		  @mobile_number_storer = MobileNumberStorer.new(mobile_number_storer_params)
	      puts @mobile_number_storer.errors.full_messages
	      @mobile_number_storer.save
	      puts ShopifyAPI::Shop.current
	      arr1 = ShopifyAPI::Customer.where(email: "#{options[:email_id]}")
	      puts arr1
	      @customer = ShopifyAPI::Customer.search(query: "email:#{options[:email_id]}")
	      @customer = @customer.first
	      binding.pry
	      if(@customer)
		      @customer.phone = options[:mobile_number]
		      if @customer.save
		        binding.pry
		      	flash[:message] = "the product is created"
		        render plain: "Mobile number has been saved."
		        #redirect_to mobile_number_storer_path(@mobilenumber_storer.id)
		      else
		        binding.pry
		        render action: "new"
		      end
		  else
            puts "the customer doesnot exist and the @customer variable shows"
            puts @customer
		  	render plain: "Mobile number has not been updated."
		  end   
	  
     
  end	
end

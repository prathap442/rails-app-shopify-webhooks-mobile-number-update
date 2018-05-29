module  AppProxy
	class MobileNumberStorersController < ApplicationController
	  include ShopifyApp::AppProxyVerification 
	  protect_from_forgery
	  #before_action :set_mobile_number_storer, only: [:show, :edit, :update, :destroy, :update_mobile_number]
	  	
	  # GET /mobile_number_storers
	  # GET /mobile_number_storers.json
	  # GET /mobile_number_storers/1
	  # GET /mobile_number_storers/1.json
	  def show
	  end

	  # GET /mobile_number_storers/new
	  def new
	    @mobile_number_storer = MobileNumberStorer.new
	  end

	  # GET /mobile_number_storers/1/edit
	  def edit
	  end

	  # POST /mobile_number_storers
	  # POST /mobile_number_storers.json
	  
	  def create
	  	  params.permit!
	  	  shop_url  = "https://9b0b0fe7c3115f8d629edf91ba45cb04:7b6212eef1dd85f579471a81402fdda4@#{params[:shop]}/admin";
		  ShopifyAPI::Base.site = shop_url
		  token = Shop.where(shopify_domain: params[:shop]).first.shopify_token
		  session = ShopifyAPI::Session.new(params[:shop],token)
		  puts session.token
		  scope = ["write_customers,read_customers"]
		  #permission_url = session.create_permission_url(scope, "https://#{params[:shop]}/auth/shopify/callback");	  
		  puts ShopifyAPI::Base.activate_session(session)
		  @mobile_number_storer = MobileNumberStorer.new(mobile_number_storer_params)
	      puts @mobile_number_storer.errors.full_messages
	      # @mobile_number_storer.save
	      p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	      puts ShopifyAPI::Shop.current
	      if(params[:email_id] != nil && params[:mobile_number] !=nil)
		          #(ShopifyAPI::Customer.search(query: "email:#{params[:email_id]}").first.phone = params[:mobile_number]).save
		          @customer = ShopifyAPI::Customer.search(query: "email:#{params[:email_id]}").first
	          if(@customer)
		      	  puts "customer exists"
			      @customer.attributes["phone"] = params[:mobile_number]
			      if @customer.save
			      	render plain: "Mobile number has been saved."
			        flash[:message] = "the Mobile Number has been created"
			        # binding.pry
			        #redirect_to (@mobilenumber_storer.iid)

			      else
			      	puts "failed to update the customer details"
			        render action: "new"
			      end
			  else
	            puts "the customer doesnot exist and the @customer variable shows"
	            puts @customer
			  	render plain: "Mobile number has not been updated."
			  end
       		  
       		  shop_url  = "https://9b0b0fe7c3115f8d629edf91ba45cb04:7b6212eef1dd85f579471a81402fdda4@#{params[:shop]}/admin";
		      ShopifyAPI::Base.site = shop_url
              ShopifyAPI::Session.setup(api_key: '9b0b0fe7c3115f8d629edf91ba45cb04', secret: '7b6212eef1dd85f579471a81402fdda4')
              binding.pry
              customer = ShopifyAPI::Customer.search(query: "email:#{params[:email_id]}").first

	            if(customer.attributes["phone"] == nil && customer.attributes["note"] != nil && customer!=nil)	
			           binding.pry
			                    customer.attributes["phone"] = params[:mobile_number]
			                    customer.save
			                    puts customer.save
			                    customer.attributes["note"].split("\n").each do |element|
		                           #if(element.include?("Mobile"))
			                        #   arr1 = []
			                        #   arr1 = element.split(":").second.split(" ").first
			                        #   binding.pry
			                        #   puts arr1.class
			                        #   puts customer.update_attributes({"phone": "#{element.split(":").second.split(" ").first}"})
		                            #   binding.pry
		                           #end
		                        end    
				end
		  end
		  ShopifyAPI::Base.clear_session   
	  end

	  
	  # PATCH/PUT /mobile_number_storers/1
	  # PATCH/PUT /mobile_number_storers/1.json
	  def update
	    respond_to do |format|
	      if @mobile_number_storer.update(mobile_number_storer_params)
	        format.html { redirect_to @mobile_number_storer, notice: 'Mobile number storer was successfully updated.' }
	        format.json { render :show, status: :ok, location: @mobile_number_storer }
	      else
	        format.html { render :edit }
	        format.json { render json: @mobile_number_storer.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  
	  # DELETE /mobile_number_storers/1
	  # DELETE /mobile_number_storers/1.json
	  def destroy
	    @mobile_number_storer.destroy
	    respond_to do |format|
	      format.html { redirect_to mobile_number_storers_url, notice: 'Mobile number storer was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end

	  def update_the_customer_info_after_2_minutes
	  end	

	  private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_mobile_number_storer
	      @mobile_number_storer = MobileNumberStorer.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def mobile_number_storer_params
	    end
	end
end
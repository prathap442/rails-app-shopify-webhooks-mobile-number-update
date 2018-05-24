module  AppProxy
	class MobileNumberStorersController < ApplicationController
	  include ShopifyApp::AppProxyVerification 
	  before_action :set_mobile_number_storer, only: [:show, :edit, :update, :destroy, :update_mobile_number]
	  	
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
	  	  shop_url  = "https://50a5d25b196006b2dcbd4843c8e65ead:be77b2ca48a03d3e23237e39a0a53947@vadlaputi-departmental-stores.myshopify.com/admin";
		  ShopifyAPI::Base.site = shop_url
		  session = ShopifyAPI::Session.new(ShopifyAPI::Shop.current.name.split(" ").join("-").downcase+".myshopify.com")
		  scope = ["write_customers, read_customers"]
		  sleep(5)
		  permission_url = session.create_permission_url(scope)
		  ShopifyAPI::Base.activate_session(session)
	      @mobile_number_storer = MobileNumberStorer.new(mobile_number_storer_params)
	      puts @mobile_number_storer.errors.full_messages
	      p ShopifyAPI::Shop.current.name
	      @customer = ShopifyAPI::Customer.search(query: "email:#{params[:email_id]}")

	      if(@customer.first.present?)
		      @customer.first.phone = params[:mobile_number]
		      if @customer.first.save
		        flash[:message] = "the product is created"
		        render plain: "Mobile number has been saved."
		        #p shop = ShopifyAPI::Shop.current
		        #redirect_to mobile_number_storer_path(@mobile_number_storer.id)
		      else
		        render action: "new"
		      end
		  else
		  	render plain: "Mobile number has not been updated."
		   end   
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

	  private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_mobile_number_storer
	      @mobile_number_storer = MobileNumberStorer.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def mobile_number_storer_params
	      params.permit(:mobile_number,:email_id)
	    end
	end
end
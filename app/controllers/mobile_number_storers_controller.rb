
class MobileNumberStorersController < ApplicationController
  include ShopifyApp::AppProxyVerification
  before_action :set_mobile_number_storer, only: [:show, :edit, :update, :destroy]
  
  # GET /mobile_number_storers
  # GET /mobile_number_storers.json
  def index
    @mobile_number_storers = MobileNumberStorer.all
  end

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
    @mobile_number_storer = MobileNumberStorer.new(mobile_number_storer_params)

    respond_to do |format|
      if @mobile_number_storer.save
        format.html { redirect_to @mobile_number_storer, notice: 'Mobile number storer was successfully created.' }
        format.json { render :show, status: :created, location: @mobile_number_storer }
      else
        format.html { render :new }
        format.json { render json: @mobile_number_storer.errors, status: :unprocessable_entity }
      end
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
      params.require(:mobile_number_storer).permit(:mobile_number,:email_id)
    end
end

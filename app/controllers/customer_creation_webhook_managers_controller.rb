class CustomerCreationWebhookManagersController < ApplicationController
   def index 
     @customers = CustomerCreationWebhookManager.all
   end

   def create
     @customer = CustomerCreationWebhookManager.new(customer_params) 
     if @customer.save
        deletion_of_record_if_possible(@customer) if @customer.id>10000
        redirect_to customer_creation_webhook_manager_path(@customer)
     else
     	render action: 'new'
     	redirect_to customer_creation_webhook_manager_path(@customer)
     end 	
   end

   def show
     @customer = CustomerCreationWebhookManager.find(:id)
   end	

   def destroy
     @customer = CustomerCreationWebhookManager.find(:id)
     @customer.destroy
   end
 
   private
   def customer_params
      params[:customer_creation_webhook_managers].permit(:id,:customer_id,:customer_note,:customer_email)
   end
   def deletion_of_record_if_possible(@customer)
     CustomerCreationWebhookManager.first.destroy if ((CustomerCreationWebhookManager.count)%10000 > 0)  
   end
end

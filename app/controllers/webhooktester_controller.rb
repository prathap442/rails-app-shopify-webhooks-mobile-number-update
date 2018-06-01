class WebhooktesterController < ShopifyApp::AuthenticatedController
 protect_from_forgery
 def create_a_test_webhook
 	topics = ["products/create","products/update","customers/create","customers/update"]
	 paths = ["create_a_product_webhook","update_the_product_webhook","create_the_customer_webhook","update_the_customer_webhook"]
	 binding.pry
	 topics.each_with_index do |topic,index|
		 @new_webhook = ShopifyAPI::Webhook.new({
		   topic: topic,
		   address: "https://fb70c513.ngrok.io/webhooks/#{paths[index]}", 
		   format: "json"
		 })# substitute url with your endpoint
		 binding.pry
		 @new_webhook.save
	 end
 end
 def create_the_product_webhook
   binding.pry 
 end
 def update_the_product_webhook
   binding.pry
 end
 def create_the_customer_webhook
   respond_to do |format|
     format.html
     format.text
     format.json
   end
   CustomerCreationWebhookManager.create(customer_id:params[:id],customer_mobile:params[:phone],customer_email:params[:email],customer_note:params)	
 end
 def update_the_customer_webhook
   binding.pry
 end	
end

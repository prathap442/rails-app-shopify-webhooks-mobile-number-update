class WebhooktesterController < ShopifyApp::AuthenticatedController
 protect_from_forgery
 def create_a_test_webhook
	 topics = ["products/create","products/update","customers/create","customers/update"]
	 binding.pry
	 topics.each do |topic|
		 @new_webhook = ShopifyAPI::Webhook.new({
		   topic: topic,
		   address: "https://4fe5b515.ngrok.io/products", # substitute url with your endpoint
		   format: "json"
		 })
		 binding.pry
		 @new_webhook.save
	 end
 end
end

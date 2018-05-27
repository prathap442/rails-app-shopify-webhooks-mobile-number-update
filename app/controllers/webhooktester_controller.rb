class WebhooktesterController < ShopifyApp::AuthenticatedController
 def create_a_test_webhook
	 topics = ["products/create","products/update","customers/create","customers/update"]
	 binding.pry
	 topics.each do |topic|
		 @new_webhook = ShopifyAPI::Webhook.new({
		   topic: topic,
		   address: "https://a92e9430.ngrok.io/products", # substitute url with your endpoint
		   format: "json"
		 })
		 binding.pry
		 @new_webhook.save
	 end
 end
end

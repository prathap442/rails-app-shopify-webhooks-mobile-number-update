class MobileNumberStorer < ActiveRecord::Base
  #include ShopifyApp::SessionStorage
  validates_presence_of :mobile_number,:email_id
  def self.update_the_customer_info_after_2_minutes
    
  end	
end

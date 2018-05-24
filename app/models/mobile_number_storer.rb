class MobileNumberStorer < ActiveRecord::Base
  #include ShopifyApp::SessionStorage
  validates_presence_of :mobile_number,:email_id
end

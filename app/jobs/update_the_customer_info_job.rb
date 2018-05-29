class UpdateTheCustomerInfoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    MobileNumberStorer.update_the_customer_info_after_2_minutes()
  end
end

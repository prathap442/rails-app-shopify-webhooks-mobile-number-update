class CreateCustomerCreationWebhookManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_creation_webhook_managers do |t|
      t.integer :customer_id
      t.string :customer_mobile
      t.string :customer_email
      t.string :customer_note
      t.string :str
      t.timestamps
    end
  end
end

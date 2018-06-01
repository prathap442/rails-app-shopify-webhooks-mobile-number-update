class CustomerCreationWebhookManager < ApplicationRecord
 validates_presence_of :customer_id,:customer_email,:customer_note
 validates_uniqueness_of :customer_id #i'm taking only customer_id because the customer who got created now might be in the 10,000 records and he might have got deleted from the main database and he is rejoining again and if his mobile persists in one among the 10,000 records then that thing would be rolled back   
end

class CreateMobileNumberStorers < ActiveRecord::Migration[5.1]
  def change
    create_table :mobile_number_storers do |t|
      t.string :mobile_number

      t.timestamps
    end
  end
end

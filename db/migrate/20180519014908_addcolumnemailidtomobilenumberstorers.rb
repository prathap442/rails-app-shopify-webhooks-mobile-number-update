class Addcolumnemailidtomobilenumberstorers < ActiveRecord::Migration[5.1]
  def change
    add_column :mobile_number_storers,:email_id,:string
  end
end
class CreateBills < ActiveRecord::Migration[5.1]
  def change

    create_table :bills do |t|
      t.string :description
      t.integer :representative_id #remove before re-migrating
      t.integer :pass_fail_bill_id
    end
  end
  
end

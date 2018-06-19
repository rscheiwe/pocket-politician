class CreateBills < ActiveRecord::Migration[5.1]
  def change

    create_table :bills do |t|
      t.string :description
      t.integer :representative_id
      t.integer :pass_fail_bill_id
      # t.boolean :passed

    end
  end
end

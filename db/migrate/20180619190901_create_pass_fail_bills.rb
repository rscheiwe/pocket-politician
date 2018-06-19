class CreatePassFailBills < ActiveRecord::Migration[5.1]
  def change
    create_table :pass_fail_bills do |t|
      t.integer :politician_id
      t.integer :bill_id
    end
  end
end

class Representative < ActiveRecord::Base

  has_many :bills
  # has_many :politicians, through: :pass_fail_bills

  def create_new_bill
    Bill.create
  end

end

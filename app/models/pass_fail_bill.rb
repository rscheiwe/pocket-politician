class PassFailBill < ActiveRecord::Base

  belongs_to :politician
  belongs_to :bill

end

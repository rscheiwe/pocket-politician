class Representative < ActiveRecord::Base

  has_many :bills
  # has_many :politicians, through: :pass_fail_bills
  # def self.create_with_info(name:, party:, office:, money: 50)
  #   Representative.new()
  # end
  def self.rand_cid
    x = []
    5.times do
      x << rand(0..9)
    end
    'N000' + x.join("")
  end

  # def create_new_bill
  #   Bill.create
  # end

end

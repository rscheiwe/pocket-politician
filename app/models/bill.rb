class Bill < ActiveRecord::Base

  belongs_to :representative
  has_many :pass_fail_bills
  has_many :politicians, through: :pass_fail_bills

  def initialize

    verbs = ["save", "free", "cut spending on"]
    nouns = ["dogs", "whales", "guns", "taxes"]
    @description = verbs.sample + " the " + nouns.sample

  end

  def description
    @description
  end

  # def pass_fail_bills
  #   has_many macro
  #   PassFailBill.all.select do |pfb|
  #     pfb.bill == self
  #   end
  # end

  # has_many_through
  # def politicians
  #   self.pass_fail_bills.map {|bill| bill.politician }
  # end

end

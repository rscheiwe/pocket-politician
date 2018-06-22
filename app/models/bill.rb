class Bill < ActiveRecord::Base

  belongs_to :representative
  has_many :pass_fail_bills
  has_many :politicians, through: :pass_fail_bills

  def self.describe_rando
    verbs = ["support ", "cut spending on ", "increase spending on "]
    nouns = ["the whales", "guns", "taxes", "the environment", "children",
            "education", "infrastructure", "insurance", "social security",
            "the NSA", "defense", "foreign relations"]

    verbs.sample + nouns.sample
  end

  def create_pass_fail_bills(rep1)
    PassFailBill.create(politician_id: rep1.id, bill_id: self.id)
  end

  def my_pfbills
    PassFailBill.all.select { |pfbill| pfbill.bill_id == self.id }
  end

end

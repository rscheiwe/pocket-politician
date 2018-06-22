class Representative < ActiveRecord::Base

  has_many :bills

  def self.rand_cid
    x = []
    5.times do
      x << rand(0..9)
    end
    'N000' + x.join("")
  end

  def my_bills
    Bill.all.select { |bill| bill.representative_id == self.id }
  end

  def my_pfbills
    self.my_bills.map { |bill| bill.my_pfbills }.flatten
  end

  def my_pol_ids
    self.my_pfbills.map { |pf| pf.politician_id }
  end

  def my_pols
    # binding.pry
    self.my_pol_ids.map { |id| Politician.where("id = ?", id) }.flatten
  end

  def my_pols_names
    self.my_pols.map { |pol| pol.name }
  end

end

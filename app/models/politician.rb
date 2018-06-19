class Politician < ActiveRecord::Base

  has_many :pass_fail_bills
  has_many :bills, through: :pass_fail_bills

  def self.seed_politicians
    GetData.politicians.each do |politician|
      Politician.create(politician)
    end
  end

end

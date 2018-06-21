class Politician < ActiveRecord::Base

  has_many :pass_fail_bills
  has_many :bills, through: :pass_fail_bills

  def self.seed_politicians
    GetData.politicians.each { |politician| Politician.create(politician) }
  end

  def self.by_state(state)
    Politician.where("office = ?", state)
  end

end

class Politician < ActiveRecord::Base

  has_many :pass_fail_bills
  has_many :bills, through: :pass_fail_bills

  def self.seed_politicians
    GetData.politicians.each do |politician|
      Politician.create(politician)
    end
  end

  def self.by_state(state)
    Politician.where("office = ?", state)

    #pol_x.state = 'NY01'
    #pol_x.state[0..1] = 'NY'
  end

end

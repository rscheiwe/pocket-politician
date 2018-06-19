class Politician < ActiveRecord::Base

  def self.seed_politicians
    GetData.politicians.each do |politician|
      Politician.create(politician)
    end
  end

end

require 'rest-client'
require 'json'
require 'pry'

class GetData

  attr_accessor :pols

  @@politicians = []

  def initialize

    @pols = []
  end

  def find_politicians_data(arr)
    arr.each do |state|
      response = RestClient.get "https://www.opensecrets.org/api/?method=getLegislators&id="+"#{state}"+"&apikey=1c75e9b1efe4f5eb843c6397427019e9&output=json"
      json = JSON.parse(response.body)
      @pols << json
    end
  end

  def politicians_hashes #(arr)
    #json = find_politicians_data(arr) ==> didn't work

    @@politicians << @pols.map do |pol|
      #binding.pry
      pol["response"]["legislator"].map do |congress|
    #@politicians << json["response"]["legislator"].map do |congress|
        {
          name: congress["@attributes"]["firstlast"],
          party: congress["@attributes"]["party"],
          office: congress["@attributes"]["office"][0..1],
          gender: congress["@attributes"]["gender"],
          cid: congress["@attributes"]["cid"]
        }
      end
    end
  end

  def self.politicians
    @@politicians.flatten
  end
end

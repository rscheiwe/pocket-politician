require 'rest-client'
require 'json'
require 'pry'

# def search_for_term
#     response = RestClient.get "https://www.opensecrets.org/api/?method=getLegislators&id=NY&apikey=1c75e9b1efe4f5eb843c6397427019e9&output=json"
#     json = JSON.parse(response.body)
#     #binding.pry
#     json
# end

# json["response"]["legislator"].map do |congress|
#   congress["@attributes"]["firstlast"]
# end

class Candidates

  attr_accessor :candidates, :cands

  def initialize

    @candidates = []
    @cands = []

  def find_candidates_data(arr)
    arr.each do |state|
      response = RestClient.get "https://www.opensecrets.org/api/?method=getLegislators&id="+"#{state}"+"&apikey=1c75e9b1efe4f5eb843c6397427019e9&output=json"
      json = JSON.parse(response.body)
      @cands << json
    end

  end

  def candidates_hashes #(arr)
    #json = find_candidates_data(arr) ==> didn't work

    @candidates << @cands.map do |cand|
      #binding.pry
      cand["response"]["legislator"].map do |congress|
    #@candidates << json["response"]["legislator"].map do |congress|
        {
          name: congress["@attributes"]["firstlast"],
          party: congress["@attributes"]["party"],
          office: congress["@attributes"]["office"],
          gender: congress["@attributes"]["gender"],
          cid: congress["@attributes"]["cid"]
        }
      end
      end
    end
  end

  def candidates
    @candidates.flatten
  end
end

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

  attr_accessor :candidates

  def initialize
    @candidates = []

  def find_candidates_data(state)
    response = RestClient.get "https://www.opensecrets.org/api/?method=getLegislators&id="+"#{state}"+"&apikey=1c75e9b1efe4f5eb843c6397427019e9&output=json"
    json = JSON.parse(response.body)
  end

  def candidates_hashes(arr)
    json = find_candidates_data(arr)
    # @candidates << json.map do |cand|
    #   cand["response"]["legislator"].map do |congress|
    @candidates << json["response"]["legislator"].map do |congress|
        {
          name: congress["@attributes"]["firstlast"],
          party: congress["@attributes"]["party"],
          office: congress["@attributes"]["office"]
        }

      end
    end
  end

  def candidates
    @candidates
  end
end

binding.pry

#====================#
#
# def candidates
#   arr = ["NY", "NJ", "IL"]
#   candidates = []
#
  # arr.each do |state|
  #   response = RestClient.get "https://www.opensecrets.org/api/?method=getLegislators&id="+"#{state}"+"&apikey=1c75e9b1efe4f5eb843c6397427019e9&output=json"
  #   json = JSON.parse(response.body)
#     binding.pry
#     candidates << json
#     #binding.pry
#   end
#   candidates
#   #binding.pry
# end
#
# candidates

# candidates.map do |cand|
#    cand["response"]["legislator"].map do |congress|
#      congress["@attributes"]["firstlast"]
#    end
#  end
# end

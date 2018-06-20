require 'rest-client'
require 'json'
require 'pry'

# require_relative './config/environment.rb'
# require_relative './app/models/representative.rb'
# require_relative './app/models/bill.rb'
# require_relative './app/models/politician.rb'
require_relative './data.rb'


ny = GetData.new
state_arr = ["AK", "AL", "AR", "AZ", "CA", "CO", "CT",
    "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA",
    "MA", "MD", "ME", "MI", "MN", "MO", "MS", "NC", "NE",
    "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC",
    "SD", "TN", "TX", "UT", "VA", "WA", "WI", "WV"]
    #DC
    #DE
    #MT
    #ND
    #VT
    #WY
ny.find_politicians_data(state_arr)
ny.politicians_hashes

Pry.start

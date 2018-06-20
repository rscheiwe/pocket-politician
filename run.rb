require 'rest-client'
#require 'json'
require 'pry'

#another comment

# require_relative './config/environment.rb'
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

#ruby.start
#(in pry) load './config/environment.rb'
#Politician.seed_politicians (moves to database)


#richard = Candidates.new
#richard.find_candidates_data(["NY", "NJ"])
# ==> the above pushes to @cands to be read in the
#     following method
#richard.candidates_hashes
# ==> creates hashes
#richard.candidates
# ==> returns flattened array of candidates_hashes

#API Key 1c75e9b1efe4f5eb843c6397427019e9

#==========================================
#Cleaning database and resetting index
#gem install database_cleaner
#DatabaseCleaner.clean_with(:truncation, :only => ['yourtablename'])

#==========================================
# INSTRUCTIONS
# 1. Welcome Message
# 2. Instructions Message
# 3. Name / State / Party input
# 4. Hello ____
# 5. puts Representative Card, w/ status_points & randomized CID
# 6. Ask if they'd like an instructions reminder
# 7. Or hit enter to begin
# 8. Prints first bill
# 8. Ask to support or vote against bill
# 9. Politicians are printed for user to choose
# 10. User selects politicians
# 11. Success or Failure determined ( e.g, "Sorry, Rep X didn't accept your bribe")
# 12. Print out Representative Card to show updated status_points
# 13. Replay 8-12
# 14. Break at X points for WIN, Y points for LOSS

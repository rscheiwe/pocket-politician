require 'rest-client'
require 'json'
require 'pry'

require_relative './data.rb'

Pry.start

#richard = Candidates.new
#richard.find_candidates_data(["NY", "NJ"])
# ==> the above pushes to @cands to be read in the
#     following method
#richard.candidates_hashes
# ==> creates hashes
#richard.candidates
# ==> returns flattened array of candidates_hashes

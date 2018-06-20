# require 'rest-client'
#require 'json'
require 'pry'
require_relative './config/environment.rb'
require_relative './app/models/representative.rb'
require_relative './app/models/bill.rb'
require_relative './app/models/politician.rb'

#another comment

<<<<<<< HEAD
=======
#another comment
>>>>>>> 49e8ad8bf9e5a627f2bf0bedfcef6a56a6cbbdb5

# require_relative './app/models/politician.rb'
# require_relative './data.rb'


# ny = GetData.new
# state_arr = ["AK", "AL", "AR", "AZ", "CA", "CO", "CT",
#     "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA",
#     "MA", "MD", "ME", "MI", "MN", "MO", "MS", "NC", "NE",
#     "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC",
#     "SD", "TN", "TX", "UT", "VA", "WA", "WI", "WV"]
#     #DC
#     #DE
#     #MT
#     #ND
#     #VT
#     #WY
# ny.find_politicians_data(state_arr)
# ny.politicians_hashes
#
# Pry.start

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
  puts "Welcome. Your mission is to climb the political ladder. \n
  You must gain favor by passing legislation. \n
  The only way to successfully pass legislation is by bribing your fellow representatives. \n
  You must choose 3 local represtentatives to bribe. Choose wisely! \n
  If they are from the opposing party, they will not accept your bribe."
  puts "(Enter '____' to continue. Enter '____' to quit.) \n"
  enter_quit = gets.chomp

# 3. Name / State / Party input
  puts "We'll have to gather some information on you first. Please enter your name: \n"
  rep_name = gets.chomp
  puts "Please enter your state: \n"
  rep_state = gets.chomp
  puts "Please enter your Part affiliation: \n ('d' for Democrat or 'r' for Republican.)\n"
  rep_party = gets.chomp

  new_rep = Representative.create(
    name: rep_name,
    party: rep_party,
    office: rep_state,
    money: 50,
    cid: Representative.rand_cid)




# 4. Hello ____
puts "Hello representative #{rep_name}. These are your currently have 'x money'. \n
Passing bills will increase your money, failure will lose you money. \n
Get x amount of money to win. If you drop below y, you'll lose!\n"

# 5. puts Representative Card, w/ money & randomized CID
      #ASCII printout
      puts "#{new_rep.cid} #{new_rep.office} \nRepresentative #{new_rep.name}, assets: $#{new_rep.money}, party: #{new_rep.party}"

# 6. Ask if they'd like an instructions reminder
# 7. Or hit enter to begin
    #puts instructions list

# 8. Prints first bill
  new_bill = Bill.create(representative_id: new_rep.id, description: Bill.describe_rando)



# 8. Ask to support or vote against bill
  "Enter 's' to support bill or 'r' to reject bill:"
  support_reject = gets.chomp
    if support_reject.downcase == 's'

    elsif support_reject.downcase == 'r'
    end


# 9. Politicians are printed for user to choose
  puts "#{Politician.by_state(new_rep.office)}"
  #puts an array with indexes of sample of 5 politicians from table

# 10. User selects politicians
  puts "Enter the number next to the first representative you wish to bribe."
  rep_1 = gets.chomp
  #show updated list
  puts "Enter the number next to the second representative you wish to bribe."
  rep_2 = gets.chomp
  #shows updated list
  puts "Enter the number next to the third representative you wish to bribe."
  rep_3 = gets.chomp

# 11. Success or Failure determined ( e.g, "Sorry, Rep X didn't accept your bribe")
# 12. Print out Representative Card to show updated status_points
# 13. Replay 8-12
# 14. Break at X points for WIN, Y points for LOSS

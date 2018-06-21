# require 'rest-client'
#require 'json'
require 'io/console'
require 'pry'
require_relative './config/environment.rb'
require_relative './app/models/representative.rb'
require_relative './app/models/bill.rb'
require_relative './app/models/politician.rb'

#==========================================

puts "                        __            __"
puts "                       /\\ \\          /\\ \\__"
puts "  _____     ___     ___\\ \\ \\/'\\      __\\ \ ,_\\"
puts " /\\ '__`\\  / __`\\  /'___\\ \\ , <    /'__`\\ \\\/"
puts " \\ \\ \\L\\ \\/\\ \\L\\ \\/\\ \\__/\\ \\ \\\\`\\ /\\  __/\\ \\_"
puts "  \\ \\ ,__/\\ \\____/\\ \\____\\\\ \\_\\ \\_\\ \\____\\\\ \__\\"
puts "   \\ \\ \\/  \\/___/  \\/____/ \\/_/\\/_/\\/____/\\/__/"
puts "    \\ \\_\\"
puts "     \\/_/"
puts "               ___        __"
puts "              /\\_ \\    __/\\ \\__  __          __"
puts " _____     ___\\//\\ \\  /\\_\\ \\ ,_\\/\\_\\    ___ /\\_\\     __      ___"
puts "/\\ '__`\\  / __`\\\\ \\ \\ \\/\\ \\ \\ \\/\\/\\ \\  /'___\\/\\ \\  /'__`\\  /' _ `\\ "
puts "\\ \\ \\L\\ \\/\\ \\L\\ \\\\_\\ \\_\\ \\ \\ \\ \\_\\ \\ \\/\\ \\__/\\ \\ \\/\\ \\L\\.\\_/\\ \\/\\ \\ "
puts " \\ \\ ,__/\\ \\____//\\____\\\\ \\_\\ \\__\\\\ \\_\\ \\____\\\\ \\_\\ \\__/.\\_\\ \\_\\ \\_\\ "
puts "  \\ \\ \\/  \\/___/ \\/____/ \\/_/\\/__/ \\/_/\\/____/ \\/_/\\/__/\\/_/\\/_/\\/_/"
puts "   \\ \\_\\"
puts "    \\/_/"
puts ""

#====================================================

def rep_card(new_rep)
  puts "    " + "Representative Card".center(40, "=*")
  puts "    *" + "*".rjust(39)
  puts "    " + "Representative #{new_rep.name.upcase}".center(40, " ")
  puts "    *" + "*".rjust(39)
  puts "    " + "#{new_rep.cid}".center(40, " ")
  puts "    *" + "*".rjust(39)
  puts "    " + "# # # #::::::".center(40, " ")
  puts "    *" + "# # # #::::::".center(38, " ") + "*".rjust(1)
  puts "    " + "# # # #::::::".center(40, " ")
  puts "    *" + "# # # # # # #".center(38, " ") + "*".rjust(1)
  puts "    " + "# # # # # # #".center(40, " ")
  puts "    *" + "# # # # # # #".center(38, " ") + "*".rjust(1)
  puts "    " + "# # # # # # #".center(40, " ")
  puts "    *" + "# # # # # # #".center(38, " ") + "*".rjust(1)
  puts "    " + "# # # # # # #".center(40, " ")
  puts "    *" + "*".rjust(39)
  puts "    " + "Party Affiliation: #{new_rep.party.upcase}".center(40, " ")
  puts "    *" + "*".rjust(39)
  puts "    " + "Constituent State: #{new_rep.office.upcase}".center(40, " ")
  puts "    *" + "*".rjust(39)
  puts "    " + "USA".center(40, "=*")
end

def continue_story
  print "(press any key to continue)"
  STDIN.getch
  print "            \r" # extra space to overwrite in case next sentence is short
end

array = [ "/", "-", "|", "/", "-", "\\", " "]
def makeNewLine(array)
  diff = nil
  print array[0], "\r"
  for i in (1..array.count - 1)
      #sleep @speed.to_f
      sleep 0.2
      if array[i].length < array[i - 1].length
           diff = array[i - 1].length - array[i].length
      end
      print array[i]
      diff.times { print " " } if !diff.nil?
      print "\r"
      $stdout.flush
  end
end

#FOR PROGRESS BAR
spinner = Enumerator.new do |e|
  loop do
    e.yield '|'
    e.yield '/'
    e.yield '-'
    e.yield '\\'
  end
end

#slowly do <code> end
def slowly
  yield.each_char { |c| putc c; $stdout.flush; sleep 0.25 }
end

#=================================================

sleep(2)
slowly do
  "W E L C O M E".center(50, " *")
end
puts ""
puts ""
sleep(2)

puts "Your mission is to climb the political ladder. \n
You must gain favor by passing legislation. \n
The only way to successfully pass legislation is by bribing your fellow representatives. \n
You must choose 3 local represtentatives to bribe. Choose wisely! \n
If they are from the opposing party, they will not accept your bribe."
puts ""
continue_story

  # puts "(Enter '____' to continue. Enter '____' to quit.) \n"
  # enter_quit = gets.chomp

puts "We'll have to gather some information on you first."
4.times  { makeNewLine(array) }

puts "Please enter your name: "
rep_name = gets.chomp
3.times  { makeNewLine(array) }
puts ""

puts "Please enter your state: \n"
rep_state = gets.chomp
3.times  { makeNewLine(array) }
puts ""

puts "Please enter your Party affiliation: \n ('d' for Democrat or 'r' for Republican.)\n"
rep_party = gets.chomp
3.times  { makeNewLine(array) }
puts ""

#create Representative class instance of user
new_rep = Representative.create(
  name: rep_name,
  party: rep_party,
  office: rep_state,
  money: 50,
  cid: Representative.rand_cid)

puts "Hello, representative #{rep_name}."
sleep(0.5)

puts "You currently have: "
0.upto(5) do
  STDOUT.print "\r$50"
  sleep 0.25
  STDOUT.print "\r   " # Send return and six spaces
  sleep 0.25
end
puts "$50"
sleep(0.5)

puts "Passing bills will increase your money, failure will lose you money."
sleep(0.5)

puts "Get $100 to win. But if you drop below $0, you'll lose!"
puts ""
puts ""
continue_story

puts "Printing your representative ID card. Don't lose it!"
3.times  { makeNewLine(array) }
puts ""
puts rep_card(new_rep)
puts ""
sleep(1)

continue_story
# 6. Ask if they'd like an instructions reminder
# 7. Or hit enter to begin
    #puts instructions list

# 8. Prints first bill
puts "We are now creating a bill for you to decide on"
puts ""

1.upto(100) do |i|
  progress = "=" * (i/5) unless i < 5
  printf("\rGenerating Bill: [%-20s] %d%% %s", progress, i, spinner.next)
  sleep(0.05)
end

puts ""
sleep(2)
puts ""

#create new Bill class instance
new_bill = Bill.create(representative_id: new_rep.id, description: Bill.describe_rando)

puts "Your bill is: "
puts ""

new_bill.description.upcase.each_char do |char|
   putc char
   $stdout.flush
   sleep 0.25
end

puts ""
sleep(2)
puts ""

puts "We are now gathering politicians to bribe"
puts ""

1.upto(100) do |i|
  progress = "=" * (i/5) unless i < 5
  printf("\rGenerating Politicians: [%-20s] %d%% %s", progress, i, spinner.next)
  sleep(0.05)
end

puts ""
puts ""
sleep(1)

puts "So, your bill is: "
0.upto(5) do
  STDOUT.print "\r#{new_bill.description.upcase}"
  sleep 0.25
  STDOUT.print "\r                              " # Send return and six spaces
  sleep 0.25
end
puts "#{new_bill.description.upcase}"
puts ""

# 8. Ask to support or vote against bill
  # "Enter 's' to support bill or 'r' to reject bill:"
  # support_reject = gets.chomp
  #   if support_reject.downcase == 's'
  #
  #   elsif support_reject.downcase == 'r'
  #   end

#loop do
  politician_array = Politician.by_state(new_rep.office)

  # def map_with_index(politician_ar)
  #   politician_ar.map.with_index {|pol, i| "   #{i + 1}. #{pol.name}" }
  # end

  def map_with_index(politician_ar)
    politician_ar.map.with_index do |pol, i|
      puts "   #{i + 1}. #{pol.name}"
      $stdout.flush
      sleep 0.25
    end
  end

  #=============================================
  #PUTS FIRST LIST of Politicians
  #REP_1 == Instance of Politician
  puts "POLITICIANS".center(30, " *")
  puts ""
  puts map_with_index(politician_array)
  puts ""
  puts "".center(30, " *")
  puts ""

  puts "** Enter the number next to the first representative you wish to bribe **"

  select_rep_1 = gets.chomp  #1
  rep_1 = politician_array[select_rep_1.to_i - 1]  #1-1 = 0
  puts ""
  puts "".center(30, " $ ")
  puts "#{rep_1.name}".center(30, "  $  ")
  puts "".center(30, " $ ")
  puts ""
  sleep(2)

  #============================================
  #PUTS SECOND LIST of Politicians
  #REP_2 == Instance of Politician
  puts "POLITICIANS".center(30, " *")
  puts ""
  politician_array = politician_array - [rep_1]
  puts map_with_index(politician_array)
  puts ""
  puts "".center(30, " *")
  puts ""

  puts "** Enter the next person you wish to bribe **"

  select_rep_2 = gets.chomp  #1
  rep_2 = politician_array[select_rep_2.to_i - 1]  #1-1 = 0
  puts ""
  puts "".center(30, " $ ")
  puts "#{rep_2.name}".center(30, "  $  ")
  puts "".center(30, " $ ")
  puts ""
  sleep(2)

  #=============================================
  #PUTS THIRD LIST of Politicians
  #REP_3 == Instance of Politician
  puts "POLITICIANS".center(30, " *")
  puts ""
  politician_array = politician_array - [rep_2]
  puts map_with_index(politician_array)
  puts ""
  puts "".center(30, " *")
  puts ""

  puts "** Enter the next person you wish to bribe **"

  select_rep_3 = gets.chomp  #1
  rep_3 = politician_array[select_rep_3.to_i - 1]  #1-1 = 0
  puts ""
  puts "".center(30, " $ ")
  puts "#{rep_3.name}".center(30, "  $  ")
  puts "".center(30, " $ ")
  puts ""
  sleep(2)

  #=============================================

  politician_array = politician_array - [rep_3]
  puts map_with_index(politician_array)

  #============================================

    puts ""
    puts ""

    puts "BRIBE RESULTS".center(40, " *")
    puts "*" + "*".rjust(39)
    puts "1. #{rep_1.name} -- #{rep_1.party}".center(40, " ")
    puts "*" + "*".rjust(39)
    puts "2. #{rep_2.name} -- #{rep_2.party}".center(40, " ")
    puts "*" + "*".rjust(39)
    puts "3. #{rep_3.name} -- #{rep_3.party}".center(40, " ")
    puts "*" + "*".rjust(39)
    puts "_.-'~~`~~'-._".center(40, " ")
    puts "*" + ".'`  B   E   R  `'.".center(38, " ") + "*".rjust(1)
    puts "/ I               T \\".center(40, " ")
    puts "*" + "/       .-'~*-.       \\".center(38, " ") + "*".rjust(1)
    puts "; L     / `-    \      Y ;".center(40, " ")
    puts "*" + ";       />  `.  -.|       ;".center(38, " ") + "*".rjust(1)
    puts "|      /_     '-.__)      |".center(40, " ")
    puts "*" + "|        |-  _.' \ |       |".center(38, " ") + "*".rjust(1)
    puts ";        `~~;     \\       ;".center(40, " ")
    puts "*" + ";  INGODWE /      \\)P   ;".center(38, " ") + "*".rjust(1)
    puts "\\  TRUST '.___.-'`*     /".center(40, " ")
    puts "*" + "`\\                   /`".center(38, " ") + "*".rjust(1)
    puts "'._   1 9 9 7   _.'".center(40, " ")
    puts "*" + "`'-..,,,..-'`".center(38, " ") + "*".rjust(1)
    puts "USA".center(40, " *")
    puts ""
    puts ""
    sleep(3)

  #============================================

  party_arr = [rep_1.party.downcase, rep_2.party.downcase, rep_3.party.downcase]
  if new_rep.party.downcase == 'd' && party_arr.count('d') >= 2
    puts "You did it! Enough representatives accepted your bribes."
    new_rep.money += 20
  elsif new_rep.party.downcase == 'r' && party_arr.count('r') >= 2
    puts "You did it! Enough representatives accepted your bribes."
    new_rep.money += 20
  else
    puts "Sorry, too many representatives from the other party rejected your bribes."
    new_rep.money -= 10
  end
  puts ""

  Representative.update(new_rep.id, :money => new_rep.money)
  puts rep_card(new_rep)

#   break if new_rep.money > 100 || new_rep.money < 0
# end

#end






# 11. Success or Failure determined ( e.g, "Sorry, Rep X didn't accept your bribe")
# 12. Print out Representative Card to show updated status_points
# 13. Replay 8-12
# 14. Break at X points for WIN, Y points for LOSS

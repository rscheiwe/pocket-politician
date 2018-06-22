require 'rubygems'
require 'colorize'
require 'io/console'
require 'pry'

require_relative './config/environment.rb'
require_relative './app/models/representative.rb'
require_relative './app/models/bill.rb'
require_relative './app/models/politician.rb'
require_relative './game_method.rb'

system "clear"
#===================================================
GameMethod.title
#====================================================
array = [ "/".colorize(:light_green), "-".colorize(:light_green), "|".colorize(:light_green), "/".colorize(:light_green), "-".colorize(:light_green), "\\", " ".colorize(:light_green)]

spinner = Enumerator.new do |e|
  loop do
    e.yield '|'
    e.yield '/'
    e.yield '-'
    e.yield '\\'
  end
end
#=================================================

GameMethod.slowly do
  "".center(60, " *").colorize(:background => :red)
end

puts "\n"
GameMethod.slowly do
  "W E L C O M E".center(60, " *").colorize(:background => :light_blue)
end

puts "\n"
GameMethod.slowly do
  "".center(60, " *").colorize(:background => :white)
end
puts "\n"*2

puts "Your mission is to climb the political ladder. \n
You must gain favor by passing legislation. \n
The only way to successfully pass legislation is by " + "bribing".colorize(:green) + " your fellow representatives. \n
You must choose 3 local represtentatives to bribe. Choose wisely! \n
If they are from the opposing party, they will not accept your bribe."
puts ""
puts "\n"

GameMethod.usa_banner
GameMethod.continue_story
system "clear"

GameMethod.usa_banner
puts "We'll have to gather some information on you first."
1.times  { GameMethod.makeNewLine(array) }

puts "Please enter your name: "
rep_name = gets.chomp
1.times  { GameMethod.makeNewLine(array) }
puts ""

rep_state = ""
  loop do
    puts "Please enter your state: \n"
    rep_state = gets.chomp.upcase
      if rep_state.length != 2
      puts "Please enter state abreviation (i.e. CA, NY)"
    end
  break if rep_state.length == 2
  end

1.times  { GameMethod.makeNewLine(array) }
puts ""

rep_party = ""
  loop do
    puts "Please enter your Party affiliation: \n ('D' for Democrat or 'R' for Republican.)\n"
    rep_party = gets.chomp.downcase
      if rep_party.length != 1
        puts "Please only enter 'D' or 'R'."
      end
    1.times  { GameMethod.makeNewLine(array) }
    puts ""
  break if rep_party == 'd' || rep_party == 'r'
  end

#create Representative class instance of user
new_rep = Representative.create(
  name: rep_name,
  party: rep_party,
  office: rep_state,
  money: 50,
  cid: Representative.rand_cid)

puts "Hello, representative #{rep_name}."
sleep(0.5)
puts ""

puts "You currently have: "
0.upto(5) do
  STDOUT.print "\r\e[5;1;32;42m$50\e[0m".colorize(:green)
  sleep 0.25
  STDOUT.print "\r   " # Send return and six spaces
  sleep 0.25
end
puts "$50".colorize(:light_green)
sleep(0.5)
puts ""

puts "Passing bills will add " + "$20".colorize(:light_green) + " to your wealth; failure will cost you " + "$10".colorize(:light_red) + " of your fortune."
sleep(0.5)
puts ""

puts "Get " + "$100".colorize(:light_green) + " to win. But if you drop below " + "$0".colorize(:light_red) + ", you'll lose!"
puts "\n"*2
GameMethod.usa_banner
GameMethod.continue_story
system "clear"

GameMethod.usa_banner
puts "Printing your representative ID card. Don't lose it!"
1.times  { GameMethod.makeNewLine(array) }
puts ""
puts GameMethod.rep_card(new_rep)
puts "\n"*2
GameMethod.usa_banner
sleep(1)
GameMethod.continue_story
system "clear"
#=================================================

rep_arr = []
politician_array = Politician.by_state(new_rep.office)

loop do
  # 8. Prints first bill
  GameMethod.usa_banner
  puts "We are now creating a bill for you to decide on"
  puts ""

  # progress bar
  1.upto(100) do |i|
    progress = "=" * (i/5) unless i < 5
    printf("\rGenerating Bill: [%-20s] %d%% %s", progress, i, spinner.next)
    sleep(0.025)
  end

  puts ""
  sleep(2)
  puts ""

  new_bill = Bill.create(representative_id: new_rep.id, description: Bill.describe_rando)

  puts "Your bill is: "
  puts ""

  new_bill.description.upcase.each_char do |char|
     putc char
     $stdout.flush
     sleep 0.1
  end

  puts ""
  sleep(2)
  puts ""

  puts "We are now gathering politicians to bribe"
  puts ""

  1.upto(100) do |i|
    progress = "=" * (i/5) unless i < 5
    printf("\rGenerating Politicians: [%-20s] %d%% %s", progress, i, spinner.next)
    sleep(0.025)
  end

  puts "\n"*2
  sleep(1)

  puts "REMEMBER: your bill is: "
  0.upto(5) do
    STDOUT.print "\r#{new_bill.description.upcase}".colorize(:light_yellow)
    sleep 0.25
    STDOUT.print "\r                              " # Send return and six spaces
    sleep 0.25
  end
  puts "#{new_bill.description.upcase}"

  puts "\n"*2
  puts "U S A".center(60, " *").colorize(:background => :light_blue)

  GameMethod.continue_story

  if !rep_arr.empty?
    politician_array = politician_array - rep_arr
  else
    politician_array = politician_array
  end

  if politician_array.length <= 10
    puts "Sorry, there aren't enought politicians in your state to bribe. We're going to bus in some from other areas!"
    politician_array = Politician.all.sample(15)
  end

  # def map_with_index(politician_ar)
  #   politician_ar.map.with_index {|pol, i| "   #{i + 1}. #{pol.name}" }
  # end



  system "clear"
  #=============================================
  #PUTS FIRST LIST of Politicians
  #REP_1 == Instance of Politician
  GameMethod.politician_banner
  GameMethod.map_with_index(politician_array)
  GameMethod.red_banner

  puts "CURRENT BILL: ".colorize(:light_red) + "#{new_bill.description.upcase}".colorize(:yellow)
  puts "** Enter the number next to the first representative you wish to bribe **"

  select_rep_1 = gets.chomp  #1
  rep_1 = politician_array[select_rep_1.to_i - 1]  #1-1 = 0
  GameMethod.bribed(rep_1.name)

  system "clear"
  #============================================
  #PUTS SECOND LIST of Politicians
  #REP_2 == Instance of Politician
  GameMethod.politician_banner
  politician_array = politician_array - [rep_1]
  GameMethod.map_with_index(politician_array)
  GameMethod.red_banner

  puts "CURRENT BILL: ".colorize(:light_red) + "#{new_bill.description.upcase}".colorize(:yellow)
  puts "** Enter the next person you wish to bribe **"

  select_rep_2 = gets.chomp  #1
  rep_2 = politician_array[select_rep_2.to_i - 1]  #1-1 = 0
  GameMethod.bribed(rep_2.name)

  system "clear"
  #=============================================
  #PUTS THIRD LIST of Politicians
  #REP_3 == Instance of Politician
  GameMethod.politician_banner
  politician_array = politician_array - [rep_2]
  GameMethod.map_with_index(politician_array)
  GameMethod.red_banner

  puts "CURRENT BILL: ".colorize(:light_red) + "#{new_bill.description.upcase}".colorize(:yellow)
  puts "** Enter the next person you wish to bribe **"

  select_rep_3 = gets.chomp  #1
  rep_3 = politician_array[select_rep_3.to_i - 1]  #1-1 = 0
  GameMethod.bribed(rep_3.name)

  #=============================================

  politician_array = politician_array - [rep_3]

  #============================================
  system "clear"
  GameMethod.bribe_results(rep_1, rep_2, rep_3)

  #============================================

  rep_arr = [rep_1, rep_2, rep_3]

  if new_rep.party.downcase == 'd' && (rep_arr.count {|rep| rep.party == 'D' } >= 2)
    puts "You did it! Enough representatives accepted your bribes."
    new_rep.money += 20

    rep_arr.each do |rep|
      if rep.party == "D"
        new_bill.create_pass_fail_bills(rep)
      end
    end

  elsif new_rep.party.downcase == 'r' && (rep_arr.count {|rep| rep.party == 'R' } >= 2)
    puts "You did it! Enough representatives accepted your bribes."
    new_rep.money += 20

    rep_arr.each do |rep|
      if rep.party == "R"
        new_bill.create_pass_fail_bills(rep)
      end
    end

  else
    puts "Sorry, too many representatives from the other party rejected your bribes."
    new_rep.money -= 10
  end
  puts "\n"*2
  Representative.update(new_rep.id, :money => new_rep.money)

  GameMethod.usa_banner
  GameMethod.continue_story

  system "clear"

  GameMethod.usa_banner
  puts GameMethod.rep_card(new_rep)
  puts ""

  puts "You currently have: "
  0.upto(5) do
    STDOUT.print "\r$#{new_rep.money}".colorize(:light_green)
    sleep 0.25
    STDOUT.print "\r   " # Send return and six spaces
    sleep 0.25
  end
  puts "$#{new_rep.money}".colorize(:light_green)
  sleep(0.5)
  puts "\n"*2
  GameMethod.usa_banner
  GameMethod.continue_story
  system "clear"

  break if new_rep.money >= 60 || new_rep.money < 0
end

system "clear"

GameMethod.usa_banner
0.upto(5) do
  STDOUT.print "\rCONGRATULATIONS".colorize(:light_green)
  sleep 0.25
  STDOUT.print "\r               "
  sleep 0.25
end
puts ""

pocketed_politicians = new_rep.my_pols_names.uniq
puts "Here are your pocketed politicians! "
puts ""
pocketed_politicians.map { |pol| p pol }

GameMethod.money_sign

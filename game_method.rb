class GameMethod

  def initialize
  end

  def self.title
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
  end

  def self.rep_card(new_rep)
    puts "    " + "Representative Card".center(40, "=*").colorize(:light_blue)
    puts "    *" + "*".rjust(39)
    puts "    " + "Representative #{new_rep.name.upcase}".center(40, " ")
    puts "    *".colorize(:light_red) + "*".rjust(39).colorize(:light_red)
    puts "    " + "#{new_rep.cid}".center(40, " ")
    puts "    *" + "*".rjust(39)
    puts "    " + "# # # #::::::".center(40, " ")
    puts "    *".colorize(:light_red) + "# # # #::::::".center(38, " ") + "*".rjust(1).colorize(:light_red)
    puts "    " + "# # # #::::::".center(40, " ")
    puts "    *" + "# # # # # # #".center(38, " ") + "*".rjust(1)
    puts "    " + "# # # # # # #".center(40, " ")
    puts "    *".colorize(:light_red) + "# # # # # # #".center(38, " ") + "*".rjust(1).colorize(:light_red)
    puts "    " + "# # # # # # #".center(40, " ")
    puts "    *" + "# # # # # # #".center(38, " ") + "*".rjust(1)
    puts "    " + "# # # # # # #".center(40, " ")
    puts "    *".colorize(:light_red) + "*".rjust(39).colorize(:light_red)
    puts "    " + "Party Affiliation: #{new_rep.party.upcase}".center(40, " ")
    puts "    *" + "*".rjust(39)
    puts "    " + "Constituent State: #{new_rep.office.upcase}".center(40, " ")
    puts "    *".colorize(:light_red) + "*".rjust(39).colorize(:light_red)
    puts "    " + "USA".center(40, "=*").colorize(:light_blue)
  end

  def self.money_sign
    puts "  ,,,,,,,,,,,,,,,,,,,,,,$$$$".colorize(:light_green)
    puts "  ,,,,,,,,,,,$$$$$$$$$$$$$$$$$".colorize(:light_green)
    puts "  ,,,,,,,$$$$$$$$$$$$$$$$$$$$$$$$$".colorize(:light_green)
    puts "  ,,,,,$$$$$$$,,,,,,,$$$$,,,,$$$$$$$$".colorize(:light_green)
    puts "  ,,,$$$$$$,,,,,,,,,,$$$$,,,,,,,,$$$$$$$".colorize(:light_green)
    puts "  ,,$$$$$$,,,,,,,,,,,$$$$,,,,,,,,,,$$$$$$".colorize(:light_green)
    puts "  ,,$$$$$$,,,,,,,,,,,$$$$".colorize(:light_green)
    puts "  ,,$$$$$$,,,,,,,,,,,$$$$".colorize(:light_green)
    puts "  ,,,$$$$$$,,,,,,,,,,$$$$".colorize(:light_green)
    puts "  ,,,,$$$$$$$$,,,,,,$$$$".colorize(:light_green)
    puts "  ,,,,,,$$$$$$$$$$$$$$$$".colorize(:light_green)
    puts "  ,,,,,,,,,,$$$$$$$$$$$$$$$$$$".colorize(:light_green)
    puts "  ,,,,,,,,,,,,,,,,,$$$$$$$$$$$$$$$$".colorize(:light_green)
    puts "  ,,,,,,,,,,,,,,,,,,,,,,$$$$,$$$$$$$$$$".colorize(:light_green)
    puts "  ,,,,,,,,,,,,,,,,,,,,,,$$$$,,,,,,,$$$$$$$".colorize(:light_green)
    puts "  ,,,,,,,,,,,,,,,,,,,,,,$$$$,,,,,,,,,$$$$$$".colorize(:light_green)
    puts "  ,,,,,,,,,,,,,,,,,,,,,,$$$$,,,,,,,,,,$$$$$".colorize(:light_green)
    puts "  $$$$$$$,,,,,,,,,,,,$$$$,,,,,,,,,,$$$$$$$".colorize(:light_green)
    puts "  ,$$$$$$,,,,,,,,,,,,$$$$,,,,,,,,,,$$$$$$$".colorize(:light_green)
    puts "  ,,$$$$$$$,,,,,,,,,,$$$$,,,,,,,,$$$$$$$$".colorize(:light_green)
    puts "  ,,,$$$$$$$$,,,,,,,$$$$,,,,,,$$$$$$$$".colorize(:light_green)
    puts "  ,,,,,,$$$$$$$$$$$$$$$$$$$$$$$$$$$".colorize(:light_green)
    puts "  ,,,,,,,,,,$$$$$$$$$$$$$$$$$$$".colorize(:light_green)
    puts "  ,,,,,,,,,,,,,,,,,,$$$$$$$$".colorize(:light_green)
  end

  def self.makeNewLine(array)
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

  def self.continue_story
    print "(press any key to continue)".colorize(:light_yellow)
    STDIN.getch
    print "            \r" # extra space to overwrite in case next sentence is short
  end

  def self.slowly
    yield.each_char { |c| putc c; $stdout.flush; sleep 0.05 }
  end

end

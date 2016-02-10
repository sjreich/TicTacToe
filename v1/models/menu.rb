module Menu
  ACCEPTABLE_CHOICES = [:s, :r, :q].freeze

  def Menu.content
"
(S)tart game
(R)eview last game
(Q)uit

Your choice: "
  end

  def Menu.display
    print content
  end

  def Menu.get_selection
    selection = nil
    loop do
      selection = gets.chomp.downcase.to_sym
      print "\n"
      break if ACCEPTABLE_CHOICES.include? selection
      puts "That wasn't one of the options."
      Menu.display
    end 
    selection
  end
end
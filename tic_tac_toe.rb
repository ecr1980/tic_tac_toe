class Board
  def initialize
    @display_value = " "
  end

  def play(x)
    if (@display_value != " ")
      puts "That spot has been played"
      return false
    end
    if (x == 1)
      @display_value = "X"
    elsif (x == 2)
      @display_value = "O"
    end
    return true
  end

  def display()
    @display_value
  end
end



$a_1 = Board.new()
$a_2 = Board.new()
$a_3 = Board.new()
$b_1 = Board.new()
$b_2 = Board.new()
$b_3 = Board.new()
$c_1 = Board.new()
$c_2 = Board.new()
$c_3 = Board.new()


def gameboard()
  puts "   1   2   3 "
  puts "A  #{$a_1.display()} | #{$a_2.display()} | #{$a_3.display()} "
  puts "  -----------"
  puts "B  #{$b_1.display()} | #{$b_2.display()} | #{$b_3.display()} "
  puts "  -----------"
  puts "C  #{$c_1.display()} | #{$c_2.display()} |#{$c_3.display()} "
end

def play(x)
  if x == true
    player = 1
  else
    player = 2
  end
  puts "Player #{player}, it is your turn! Please enter your choice."
  puts "Example, enter A1 for the top left square, or C3 for the bottom right."
  gameboard()
  choice = gets
  choice = choice.downcase.chomp
  choice = choice.delete(' ')
   if is_valid_choice(choice)
    select(choice, player)
   else
    puts "I did not understand that, try again"
    puts "your entered string shows as '#{choice}'."
   end
  
end

def select(str, player)
  case str
  when "a1"
    $a_1.play(player)
  when "a2"
    $a_2.play(player)
  when "a3"
    $a_3.play(player)
  when "b1"
    $b_1.play(player)
  when "b2"
    $b_2.play(player)
  when "b3"
    $b_3.play(player)
  when "c1"
    $c_1.play(player)
  when "c2"
    $c_2.play(player)
  when "c3"
    $c_3.play(player)
  else
    puts "I'm not sure how we got this error."
  end
end

def is_valid_choice(str)
  case str
  when "a1"
    return true
  when "a2"
    return true
  when "a3"
    return true
  when "b1"
    return true
  when "b2"
    return true
  when "b3"
    return true
  when "c1"
    return true
  when "c2"
    return true
  when "c3"
    return true
  else
    return false
  end
end




$game = true
turn = true

while ($game == true)
  if (turn == true)
    if play(true)
    turn = false
    end
  elsif
    if play(false)
    turn = true
    end
  end
end

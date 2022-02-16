class Board
  def initialize
    @display_value = " "
  end

  def play(x,a,b,c = 8,d = 8)
    if (@display_value != " ")
      puts "That spot has been played"
      return false
    end
    if (x == 1)
      @display_value = "X"
    elsif (x == 2)
      @display_value = "O"
    end
    score(x,a,b,c,d) #This updates the_win condtions array
    return true
  end

  def display()
    @display_value
  end
end


#the following sets up an instance of the board class for each part of the board
$a_1 = Board.new()
$a_2 = Board.new()
$a_3 = Board.new()
$b_1 = Board.new()
$b_2 = Board.new()
$b_3 = Board.new()
$c_1 = Board.new()
$c_2 = Board.new()
$c_3 = Board.new()

$win_conditions = Array.new(9,0) #each value except the last is a win condition
$game = true #game loop ends when this is false
turn = true #Player 1 (X) goes on true, player 2 (O) on false
$game_counter = 0


def gameboard()
  puts "   1   2   3 "
  puts "A  #{$a_1.display()} | #{$a_2.display()} | #{$a_3.display()} "
  puts "  -----------"
  puts "B  #{$b_1.display()} | #{$b_2.display()} | #{$b_3.display()} "
  puts "  -----------"
  puts "C  #{$c_1.display()} | #{$c_2.display()} | #{$c_3.display()} "
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
  choice = choice.delete(' ')  #preceding code to allow multiple valid inputs
   if is_valid_choice(choice)
    select(choice, player)
   else 
    puts "I did not understand that, try again"
    puts "your entered string shows as '#{choice}'."
   end
  
end

def score(player,a,b,c,d)  #winning values are 3 for X, 30 for Y.
  adder = [a,b,c,d]
  adder.each do |i|
    if player == 1
      $win_conditions[i] += 1
    else
      $win_conditions[i] += 10
    end
  end
end

def select(str, player)  #the extra numbers sent to play() are win conditions
  case str               #that get added to for being played.
  when "a1"
    $a_1.play(player,0,3,6)
  when "a2"
    $a_2.play(player,0,4)
  when "a3"
    $a_3.play(player,0,5,7)
  when "b1"
    $b_1.play(player,1,3)
  when "b2"
    $b_2.play(player,1,4,6,7)
  when "b3"
    $b_3.play(player,1,5)
  when "c1"
    $c_1.play(player,2,3,7)
  when "c2"
    $c_2.play(player,2,4)
  when "c3"
    $c_3.play(player,2,5,6)
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

def check_for_win
  $game_counter += 1
  $win_conditions[8] = 0 #prevents false wins
  $win_conditions.each do |check|
    if check == 3
      $game = false
      puts "\n\n\n   ****  Player 1 Wins!  ****\n\n\n"
      break
    elsif check == 30
      $game = false
      puts "\n\n\n   ****  Player 2 Wins!  ****\n\n\n"
      break
    end
  end
  if ($game == true && $game_counter >= 9)
    $game = false
    puts "\n\n\n        ****     MEOW!  Cat!     ****"
    puts "      That means the game ended in a tie.\n\n\n"
  end
  if $game == false
  gameboard()
  end
end




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
  check_for_win()
end

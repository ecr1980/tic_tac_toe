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

gameboard()
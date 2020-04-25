=begin
Build a tic-tac-toe game on the command line where 
two human players can play against each other and 
the board is displayed in between turns.
=end

class Game
  def initialize()
    puts "Let's Play 2-Player Tic Tac Toe!"

    player1 = Players.new()
    player2 = Players.new()

    # Print instructional board
    @displ_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    print_board

    # Print Tic-Tac-Toe board
    @displ_array = []
    for i in 1..3 do
      for j in 1..3 do 
        i < 3 ? @displ_array << "_" : @displ_array << " "
      end
    end

    print_board

    # Alternate Turns
    for i in 1..9 do
      if i.odd?  
        move = player1.move.to_i - 1
        if @displ_array[ move ] != "x" ||  @displ_array[ move ] != "o"
          @displ_array[ move ] = player1.marker
          player1.add_move(move.to_i + 1)
          print_board

          if player1.winner? 
            puts "Congratulations! Player 1 wins!"
            return
          end
        end
      else
        move = player2.move.to_i - 1
        if @displ_array[ move ] != "x" ||  @displ_array[ move ] != "o"
          @displ_array[ move ] = player2.marker
          player2.add_move(move.to_i + 1)
          print_board

          if player2.winner? 
            puts "Congratulations! Player 2 wins!"
            return
          end
        end
      end
    end

    puts "It's a tie!"

  end

  def print_board()
    string = ""
    for i in 0..8 do
       (i + 1) % 3 == 0 ? 
       string = string + @displ_array[i].to_s + "\n" :
       string = string + @displ_array[i].to_s + "|"
    end
    puts string
  end
end


class Players < Game
  attr_reader :marker
  @@count = 0

  def initialize()
    @@count += 1
    @player_number = @@count
    @@count.odd? ? @marker = "x" : @marker = "o"
    @moves_array = []
  end

  def move()
    puts "Player #{@player_number}'s turn, place your #{@marker}"
    move = gets.chomp
  end

  def add_move(move)
    @moves_array << move
  end

  def winner?()
    winners = [ 123, 456, 789, 147, 258, 369, 159, 357]
    moves_string = @moves_array.sort.join("")

    winners.each do |combo|
      if moves_string.include?(combo.to_s) 
        return true
      end
    end

    return false
  end

end

game = Game.new()

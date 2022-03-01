# When a player is created
class Player
  attr_accessor :name, :move, :winner

  def initialize(name, move)
    @name = name
    @move = move
    @winner = false
  end

  def move_message
    puts "#{name}, make your move..."
  end

  def choice(choice, board)
    board.each do |_k, v|
      v[v.index(choice)] = move if v.include?(choice)
    end
    printer(board)
  end

  def row_checker(board)
    board.each do |_k, v|
      if (v == %w[X X X]) || (v == %w[O O O])
        @winner = true
        puts "#{name} is the Winner!"
      end
    end
  end

  def column_checker(board)
    board.each do |_k, v|
      p v[0]
    end
  end
end

# Game Introduction
puts 'Hello and welcome to tic-tac-toe!'

puts 'Player 1, what is your name?'
player_1 = Player.new(gets.chomp, 'X')
puts "Welcome #{player_1.name}, your move is #{player_1.move}"

puts 'Player 2, what is your name?'
player_2 = Player.new(gets.chomp, 'O')
puts "Welcome #{player_2.name}, your move is #{player_2.move}"

game_board = {
  a: %w[1 2 3],
  b: %w[4 5 6],
  c: %w[7 8 9]
}

def printer(board)
  board.each do |_k, v|
    p v
  end
end
printer(game_board)

i = 0
while i < 9
  player_1.move_message
  player_1.choice(gets.chomp.to_s, game_board)
  player_1.row_checker(game_board)
  break if player_1.winner == true

  i += 1

  player_2.move_message
  player_2.choice(gets.chomp.to_s, game_board)
  player_2.row_checker(game_board)
  break if player_2.winner == true

  i += 1
end

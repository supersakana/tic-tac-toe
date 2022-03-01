#  When a player is created
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
player_one = Player.new(gets.chomp, 'X')
puts "Welcome #{player_one.name}, your move is #{player_one.move}"

puts 'Player 2, what is your name?'
player_two = Player.new(gets.chomp, 'O')
puts "Welcome #{player_two.name}, your move is #{player_two.move}"

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
  player_one.move_message
  player_one.choice(gets.chomp.to_s, game_board)
  player_one.row_checker(game_board)
  break if player_one.winner == true

  i += 1

  player_two.move_message
  player_two.choice(gets.chomp.to_s, game_board)
  player_two.row_checker(game_board)
  break if player_two.winner == true

  i += 1
end

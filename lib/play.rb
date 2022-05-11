# frozen_string_literal: true

# ruby new/main.rb

require_relative 'display'
require_relative 'user'
require_relative 'board'

# main game functionality
class Play
  include Display

  attr_reader :board

  def initialize
    @player_one = nil
    @player_two = nil
    @round = 1
    @board = Board.new
  end

  # driver script
  def lets_play
    intro
    game_loop
  end

  # creates first and second player
  def intro
    @player_one = create_user(1, 'X')
    @player_two = create_user(2, 'O')
  end

  # creates a new user (private)
  def create_user(num, sym)
    name = display_name(num)
    User.new(name, sym)
  end

  # prints updated board and
  def game_loop
    until @player_one.winner? || @player_two.winner?
      @board.print_board
      move_maker
    end
  end

  # prompt for player to input move then verifies
  def move_maker
    player = @round.odd? ? @player_one : @player_two
    display_prompt(player.name)
    num = gets.chomp
    verify_move(num, player)
  end

  # checks if move is valid then updates data
  def verify_move(num, player)
    if @board.cells.include?(num.to_i)
      update(num, player)
      display_win(player.name) if player.winner?
    else
      display_invalid
      move_maker
    end
  end

  # updates board and user history
  def update(num, player)
    @board.update_board(num, player.move)
    player.update_history(num)
    @round += 1
  end
end

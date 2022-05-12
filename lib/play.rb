# frozen_string_literal: true

# ruby new/main.rb
require 'pry-byebug'
require_relative 'display'
require_relative 'user'
require_relative 'board'

# main game functionality
class Play
  include Display

  attr_reader :board

  def initialize(player_one = User.new('User 1', 'X'), player_two = User.new('User 2', 'O'))
    @player_one = player_one
    @player_two = player_two
    @round = 1
    @board = Board.new
  end

  # driver script
  def lets_play
    game_loop
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

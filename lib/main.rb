# frozen_string_literal: true

require_relative 'play'
require_relative 'user'

puts <<~HEREDOC

  Welcome to Tic-Tac-Toe!

  This is a 2 player game.

  The goal of is to get 3 in a row.

  (Click ENTER to start!)

HEREDOC

gets

def create_user(num, sym)
  name = display_name(num)
  User.new(name, sym)
end

def display_name(num)
  puts "Player #{num} , what is your name?"
  gets.chomp
end

player_one = create_user(1, 'X')
player_two = create_user(2, 'O')
game = Play.new(player_one, player_two)
game.lets_play

# ruby lib/main.rb
